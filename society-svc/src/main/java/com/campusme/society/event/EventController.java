package com.campusme.society.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventController {

  @Autowired
  private EventRepository eventRepository;

  @PreAuthorize("isMember(#id)")
  @GetMapping("/societies/{id}/events")
  public ResponseEntity<List<Event>> findBySocietyId(@PathVariable long id) {
    return ResponseEntity.ok(eventRepository.findBySocietyId(id));
  }
}
