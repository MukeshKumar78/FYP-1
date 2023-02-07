package com.campusme.society.event.mapping;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import com.campusme.society.event.Event;
import com.campusme.society.society.mapping.SocietyMapper;

@Mapper(uses = SocietyMapper.class ,componentModel = "spring")
@Named("EventMapper")
public interface EventMapper {

  List<EventResponseDTO> entityListToDTO(Iterable<Event> events);

  @Named("eventToDTOWithoutSocietyTenure")
  @Mapping(target = "society", qualifiedByName = { "SocietyMapper", "societyToDTOWithoutTenure" })
  EventResponseDTO entityToDTO(Event value);

  List<Event> dtoToEntity(Iterable<EventCreateRequestDTO> events);

  // attachments handled on controller layer
  @Mapping(target="attachments", ignore=true)
  Event dtoToEntity(EventCreateRequestDTO event);
}
