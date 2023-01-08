package com.campusme.society.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campusme.society.event.mapping.EventCreateRequestDTO;
import com.campusme.society.event.mapping.EventMapper;
import com.campusme.society.event.mapping.EventResponseDTO;

/**
 * @deprecated 
 */
@Service
public class EventService {
   
  @Autowired
  private EventRepository eventRepository;

  @Autowired
  private EventMapper mapper;

  List<EventResponseDTO> findBySocietyId(Long id) {
    List<Event> events = eventRepository.findBySocietyId(id);
    return mapper.entityListToDTO(events);
  }

  Event createInSociety(Long id, EventCreateRequestDTO eventDTO) {
    Event event = mapper.dtoToEntity(eventDTO);
    eventRepository.save(event);
    return event;
  }

}
