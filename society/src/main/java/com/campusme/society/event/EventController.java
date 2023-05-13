package com.campusme.society.event;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.FileUploadUtil;
import com.campusme.society.notifications.Notification;
import com.campusme.society.notifications.NotificationService;
import com.campusme.society.security.WebSecurity;
import com.campusme.society.society.Society;
import com.campusme.society.society.SocietyRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import com.campusme.society.user.AppUserRepository;

import io.swagger.v3.oas.annotations.Operation;

/**
 * REST Controller for Society Events
 */
@RestController
public class EventController {

  @Autowired
  private EntityManager entityManager;
  @Autowired
  private WebSecurity webSecurity;
  @Autowired
  private EventRepository eventRepository;
  @Autowired
  private EventAttachmentRepository eventAttachmentRepository;
  @Autowired
  private EventReactRepository eventReactRepository;
  @Autowired
  private FileUploadUtil fileUploadUtil;
  @Autowired
  private SocietyRepository societyRepository;
  @Autowired
  private AppUserRepository userRepository;
  @Autowired
  private NotificationService notificationService;

  /**
   * Endpoint to get all events paginated and sorted based on query parameters
   *
   * @param pageNo   Integer (default: 0)
   * @param pageSize Integer (default: 10)
   * @param sortBy   Integer (default: createdAt) sorts by descending
   */
  @Operation(summary = "get all events")
  @GetMapping("/events")
  public List<Event> findAll(
      AppUserAuthenticationToken auth,
      @RequestParam(defaultValue = "0") Integer pageNo,
      @RequestParam(defaultValue = "10") Integer pageSize,
      @RequestParam(defaultValue = "createdAt") String sortBy,
      @RequestParam(required = false) String society,
      @RequestParam(required = false, defaultValue = "false") Boolean drafts) {

    Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());

    if (drafts) {
      if (society == null)
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Society is required");
      if (!webSecurity.isMember((AppUser) auth.getPrincipal(), society))
        throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Must be a member");
      return eventRepository.findByPublished(false, paging).getContent();
    }

    if (society != null && !society.isEmpty())
      return eventRepository.findBySocietyCodeAndPublished(society, !drafts, paging).getContent();

    // if no options specified, return personalized feed events
    return eventRepository.findByFollowedSocieties(((AppUser) auth.getPrincipal()).getId(), paging).getContent();
  }

  /**
   * Endpoint to search all events based on a query
   *
   * @param query String the search input
   */
  @Operation(summary = "search events", description = "performs full-text search on title, text and posts.text fields")
  @GetMapping("/events/search")
  public List<Event> findAll(@RequestParam String query) {
    SearchSession searchSession = Search.session(entityManager);
    List<Event> events = searchSession
        .search(Event.class)
        .where(f -> f.match().fields("title", "text", "posts.text").matching(query))
        .fetch(10).hits();

    return events;
  }

  /**
   * Endpoint to get history for an event
   *
   * @param id the event id
   */
  @Operation(summary = "get event history")
  @GetMapping("/events/{id}/history")
  public List<Event> getHistory(HttpSession session, @PathVariable Long id) {
    List<Event> events = AuditReaderFactory.get(entityManager)
        .createQuery()
        .forRevisionsOfEntity(Event.class, true, true)
        .add(AuditEntity.id().eq(id))
        .add(AuditEntity.property("published").eq(true))
        .getResultList();

    return events;
  }

  /**
   * Endpoint to get a single revision of an event
   *
   * @param id       the event id
   * @param revision the event revision
   */
  @Operation(summary = "get event revision")
  @GetMapping("/events/{id}/history/{revision}")
  public Object getRevision(HttpSession session, @PathVariable Long id, @PathVariable Integer revision) {
    try {
      return AuditReaderFactory.get(entityManager)
          .createQuery()
          .forEntitiesAtRevision(Event.class, revision)
          .add(AuditEntity.id().eq(id))
          .add(AuditEntity.property("published").eq(true))
          .getSingleResult();
    } catch (NoResultException e) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND);
    }
  }

  /**
   * Endpoint to get a single event
   *
   * @param id Long the event ID
   */
  @Operation(summary = "get a single event")
  @GetMapping("/events/{id}")
  public Event findOne(AppUserAuthenticationToken auth, @PathVariable Long id) {
    Event event = eventRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Event not found"));

    if (event.isPublished() || webSecurity.isMember((AppUser) auth.getPrincipal(), event.getSociety().getCode()))
      return event;

    // Event exists but not published
    throw new ResponseStatusException(HttpStatus.NOT_FOUND);
  }

  /**
   * Endpoint to create a new event
   * 
   * @param eventDTO {@code EventCreateRequestDTO} object as multipart form data
   * @return Created {@code Event}
   */
  @Operation(summary = "create event")
  @PostMapping(path = "/events", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), #dto.getSociety(), 'event', 'create')")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Event save(AppUserAuthenticationToken auth,
      @Valid @ModelAttribute EventCreateRequestDTO dto) {

    Event event = dto.toEvent();

    // Find society
    Society society = societyRepository.findByCode(dto.getSociety()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    event.setSociety(society);
    event.setCreatedBy(((AppUser) auth.getPrincipal()));

    // Save event with associated user and society
    eventRepository.save(event);

    // Upload and Set attachments
    if (!dto.getAttachments().isEmpty()) {
      try {
        List<String> files = fileUploadUtil.upload(dto.getAttachments());

        List<EventAttachment> attachments = files.stream().map(file -> {
          EventAttachment attachment = new EventAttachment();
          attachment.setUri(file);
          attachment.setEvent(event);
          return eventAttachmentRepository.save(attachment);
        }).toList();

        event.setAttachments(attachments);

      } catch (IOException error) {
        System.out.println(error.getMessage());
        eventRepository.delete(event);
        throw new ResponseStatusException(
            HttpStatus.INTERNAL_SERVER_ERROR, "Failed to save attachments");
      }
    }

    return event;
  }

  /**
   * Endpoint to update a given event
   * 
   * @param eventDTO {@code EventUpdateRequestDTO} object as request body
   * @return Created {@code Event}
   */
  @Operation(summary = "update event")
  @PutMapping(path = "/events/{id}")
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), @webSecurity.fromEvent(#id), 'event', 'update')")
  @ResponseStatus(code = HttpStatus.OK)
  public Event update(AppUserAuthenticationToken auth,
      @PathVariable Long id,
      @Valid @RequestBody EventUpdateRequestDTO dto) {
    Event event = eventRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Event not found"));

    event.setTitle(dto.getTitle());
    event.setText(dto.getText());
    event.setStartDate(dto.getStartDate());
    event.setEndDate(dto.getEndDate());
    event.setRegistrationLink(dto.getRegistrationLink());

    return eventRepository.save(event);
  }

  /**
   * Sets an event's status to published
   *
   * @param id Long
   * @return Updated Event
   * @throws ResponseStatusException: 404 (Event not found), 304 (Event already
   *                                  published)
   */
  @Operation(summary = "publish event", description = "Sets an event's status to published")
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), @webSecurity.fromEvent(#id), 'event', 'publish')")
  @PatchMapping("/events/{id}")
  @ResponseStatus(code = HttpStatus.OK)
  public Event publish(AppUserAuthenticationToken auth, @PathVariable Long id) {
    Event event = eventRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Event not found"));

    if (event.isPublished()) {
      throw new ResponseStatusException(
          HttpStatus.NOT_MODIFIED, "Event already published");
    }

    event.setPublished(true);
    eventRepository.save(event);

    try {
      List<String> followers = userRepository
          .findFollowers(event.getSociety().getId())
          .stream()
          .map(u -> u.getCode())
          .toList();

      notificationService.publish(new Notification("New Event", event.getTitle()), followers);
    } catch (Exception e) {
      System.out.print(e);
    }

    return event;
  }

  /**
   * react or unreact to an event
   *
   * @param id Event ID
   * @throws ResponseStatusException: 404 (Event not found)
   */
  @Operation(summary = "react to an event")
  @PostMapping("/events/{id}/react")
  @ResponseStatus(code = HttpStatus.OK)
  public void react(AppUserAuthenticationToken auth, @PathVariable Long id) {
    EventReactId reactId = new EventReactId(id, ((AppUser) auth.getPrincipal()).getId());

    if (eventReactRepository.existsById(reactId)) {
      eventReactRepository.deleteById(reactId);
    } else {
      eventReactRepository.save(new EventReact(reactId));
    }
  }
}
