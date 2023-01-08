package com.campusme.society.event.mapping;

import java.util.List;

import org.mapstruct.Mapper;

import com.campusme.society.event.Event;

@Mapper(componentModel = "spring")
public interface EventMapper {
  List<EventResponseDTO> entityListToDTO(Iterable<Event> events);

  List<Event> dtoToEntity(Iterable<EventResponseDTO> events);

  EventResponseDTO entityToDTO(Event event);

  Event dtoToEntity(EventCreateRequestDTO event);
}
