package com.campusme.society.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventController {

  @Autowired
  private EventRepository eventRepository;

  @GetMapping(value = "/societies/{id}/events")
  public ResponseEntity<List<Event>> findBySocietyId(long id) {
    return ResponseEntity.ok(eventRepository.findBySociety(id));
  }
}
