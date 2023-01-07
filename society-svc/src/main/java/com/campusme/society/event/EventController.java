package com.campusme.society.event;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * REST Controller for Society Events
 */
@RestController
public class EventController {

  @Autowired
  private EventRepository eventRepository;

  /**
   * Endpoint for events of a society, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Event}s
   */
  @GetMapping("/societies/{id}/events")
  public Collection<Event> findBySocietyId(@PathVariable long id) {
    return eventRepository.findBySocietyId(id);
  }

  /**
   * Endpoint to create a new event
   * 
   * @param {@code Event} object in request body
   * @return Created {@code Event}
   */
  @PreAuthorize("hasPermission(#id, 'event', 'create')")
  @PostMapping("/societies/{id}/events")
  @ResponseStatus(code = HttpStatus.CREATED)
  public void save(Event event) {
    eventRepository.save(event);
  }

  /**
   * sets an event's status to published
   * @param eventId in path
   * @return Updated Event
   * @throws ResponseStatusException: 404 (Event not found), 304 (Event already published)
   */
  @PreAuthorize("hasPermission(#societyId, 'event', 'publish')")
  @PatchMapping("/societies/{societyId}/events/{eventId}")
  @ResponseStatus(code = HttpStatus.OK)
  public Event publish(@PathVariable Long eventId) {
    Event event = eventRepository.findById(eventId).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "event not found"));

    if (event.isPublished()) {
      throw new ResponseStatusException(HttpStatus.NOT_MODIFIED);
    }

    event.setPublished(true);
    eventRepository.save(event);
    return event;
  }
}
