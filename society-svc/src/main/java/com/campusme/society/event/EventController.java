package com.campusme.society.event;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.FileUploadUtil;
import com.campusme.society.society.Society;
import com.campusme.society.society.SocietyRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;

import io.swagger.v3.oas.annotations.Operation;

/**
 * REST Controller for Society Events
 */
@RestController
public class EventController {

  @Autowired
  private EntityManager entityManager;
  @Autowired
  private EventRepository eventRepository;
  @Autowired
  private EventAttachmentRepository eventAttachmentRepository;
  @Autowired
  private FileUploadUtil fileUploadUtil;
  @Autowired
  private SocietyRepository societyRepository;

  /**
   * Endpoint to get all events paginated and sorted based on query parameters
   *
   * @param pageNo Integer (default: 0)
   * @param pageSize Integer (default: 10)
   * @param sortBy Integer (default: createdAt) sorts by descending
   */
  @Operation(summary = "get all events")
  @GetMapping("/events")
  public List<Event> findAll(
      @RequestParam(defaultValue = "0") Integer pageNo,
      @RequestParam(defaultValue = "10") Integer pageSize,
      @RequestParam(defaultValue = "createdAt") String sortBy) {

    Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());

    List<Event> events = eventRepository.findAll(paging).getContent();

    return events;
  }

  /**
   * Endpoint to search all events based on a query 
   *
   * @param query String the search input
   */
  @Operation(summary = "search events", description="performs full-text search on title, text and posts.text fields")
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
   * Endpoint to get a single event 
   *
   * @param id Long the event ID
   */
  @Operation(summary = "get a single event")
  @GetMapping("/events/{id}")
  public Event findOne(@PathVariable Long id) {
    Event event = eventRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Event not found"));

    return event;
  }

  /**
   * Endpoint for events of a society, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Event}s
   */
  @Operation(summary = "get events in society")
  @GetMapping("/societies/{id}/events")
  public List<Event> findBySocietyId(@PathVariable long id,
      @RequestParam(defaultValue = "0") Integer pageNo,
      @RequestParam(defaultValue = "10") Integer pageSize,
      @RequestParam(defaultValue = "createdAt") String sortBy) {

    Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());
    List<Event> events = eventRepository.findBySocietyId(id, paging).getContent();
    return events;
  }

  /**
   * Endpoint to create a new event
   * 
   * @param id       society ID
   * @param eventDTO {@code EventCreateRequestDTO} object as multipart form data
   * @return Created {@code Event}
   */
  @Operation(summary = "create event")
  @PostMapping(path = "/societies/{id}/events", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), #id, 'event', 'create')")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Event save(AppUserAuthenticationToken auth, @PathVariable Long id,
      @Valid @ModelAttribute EventCreateRequestDTO dto) {

    Event event = dto.toEvent();

    // Find society
    Society society = societyRepository.findById(id).orElseThrow(
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
   * Sets an event's status to published
   *
   * @param eventId in path
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
    return event;
  }
}
