package com.campusme.society;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.campusme.society.config.persistence.CodeGenerator;
import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;

@SpringBootTest
class SocietyApiApplicationTests {

  @Autowired
  CodeGenerator generator;

  @Autowired
  EventRepository eventRepository;

  @Test
  public void givenObjectSourceTarget_thenGenerateUniqueCode() {
    long id = 1;
    Event event = eventRepository.findById(id).get();

    Event event2 = Event.builder()
      .startDate(event.getStartDate())
      .title(event.getTitle())
      .text(event.getText())
      .createdBy(event.getCreatedBy())
      .society(event.getSociety())
      .build();

    event2.setCode(generator.generate(event2, event2.getTitle(), "code"));

    eventRepository.save(event2);

    Event event3 = Event.builder()
      .startDate(event.getStartDate())
      .title(event.getTitle())
      .text(event.getText())
      .createdBy(event.getCreatedBy())
      .society(event.getSociety())
      .build();
    
    event3.setCode(generator.generate(event3, event3.getTitle(), "code"));
    
    eventRepository.save(event3);

    assertEquals(event2.getCode(), "test-event-1");
    assertEquals(event3.getCode(), "test-event-2");
  }
}
