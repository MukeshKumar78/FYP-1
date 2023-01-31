package com.campusme.society.event;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.config.persistence.FileUploadUtil;
import com.campusme.society.event.mapping.EventCreateRequestDTO;
import com.campusme.society.event.mapping.EventMapper;
import com.campusme.society.event.mapping.EventResponseDTO;
import com.campusme.society.member.Member;
import com.campusme.society.member.MemberRepository;
import com.campusme.society.society.Society;
import com.campusme.society.society.SocietyRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;

/**
 * REST Controller for Society Events
 */
@RestController
public class EventController {

  @Autowired
  private EventRepository eventRepository;

  @Autowired
  private EventAttachmentRepository eventAttachmentRepository;

  @Autowired
  private EventMapper mapper;

  @Autowired
  private FileUploadUtil fileUploadUtil;

  @Autowired
  private SocietyRepository societyRepository;
  @Autowired
  private MemberRepository memberRepository;

  @GetMapping("/events")
  public List<EventResponseDTO> findAll() {
    List<Event> events = eventRepository.findAll();
    return mapper.entityListToDTO(events);
  }

  @GetMapping("/events/{id}")
  public EventResponseDTO findOne(@PathVariable Long id) {
    Event event = eventRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Event not found"));

    return mapper.entityToDTO(event);
  }

  /**
   * Endpoint for events of a society, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Event}s
   */
  @GetMapping("/societies/{id}/events")
  public List<EventResponseDTO> findBySocietyId(@PathVariable long id) {
    List<Event> events = eventRepository.findBySocietyId(id);
    return mapper.entityListToDTO(events);
  }

  /**
   * Endpoint to create a new event
   * 
   * @param id society ID
   * @param eventDTO {@code EventCreateRequestDTO} object as multipart form data
   * @return Created {@code Event}
   */
  // @PreAuthorize("hasPermission(#id, 'event', 'create')")
  @PostMapping(path = "/societies/{id}/events", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @ResponseStatus(code = HttpStatus.CREATED)
  public EventResponseDTO save(AppUserAuthenticationToken auth, @PathVariable Long id,
      @ModelAttribute EventCreateRequestDTO eventDTO) {
    Event event = mapper.dtoToEntity(eventDTO);

    // Set Society
    Society society = societyRepository.getReferenceById(id);
    if (society == null) {
      throw new ResponseStatusException(
          HttpStatus.NOT_FOUND, "Society not found");
    }
    event.setSociety(society);

    // Set Member
    Member member = memberRepository.findByUserIdAndSocietyId(
        ((AppUser) auth.getPrincipal()).getId(),
        id);
    if (member == null) {
      throw new ResponseStatusException(
          HttpStatus.UNAUTHORIZED);
    }
    event.setCreatedBy(member);

    // Save event
    eventRepository.save(event);

    // Upload and Set attachments
    if (!eventDTO.getAttachments().isEmpty()) {
      try {
        List<String> files = fileUploadUtil.upload(eventDTO.getAttachments());

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

    return mapper.entityToDTO(event);
  }

  /**
   * Sets an event's status to published
   *
   * @param eventId in path
   * @return Updated Event
   * @throws ResponseStatusException: 404 (Event not found), 304 (Event already
   *                                  published)
   */
  @PreAuthorize("hasPermission(#societyId, 'event', 'publish')")
  @PatchMapping("/societies/{societyId}/events/{eventId}")
  @ResponseStatus(code = HttpStatus.OK)
  public Event publish(@PathVariable Long eventId) {
    Event event = eventRepository.findById(eventId).orElseThrow(
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
