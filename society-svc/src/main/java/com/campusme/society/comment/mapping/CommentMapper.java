package com.campusme.society.comment.mapping;

import com.campusme.society.event.mapping.EventMapper;
import com.campusme.society.comment.Comment;

import org.mapstruct.IterableMapping;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(uses = EventMapper.class ,componentModel = "spring")
public interface CommentMapper {
    List<CommentResponseDTO> entityListToDTO(Iterable<Comment> comments);

    @IterableMapping(qualifiedByName = "entityToDTOWithoutEvent")
    List<CommentResponseDTO> entityListToDTOWithoutEvent(Iterable<Comment> comments);

    @Mapping(target = "event", qualifiedByName = { "EventMapper", "eventToDTOWithoutSocietyTenure" })
    CommentResponseDTO entityToDTO(Comment value);

    @Mapping(target = "event", ignore=true) @Named("entityToDTOWithoutEvent")
    CommentResponseDTO entityToDTOWithoutEvent(Comment value);

    List<Comment> dtoToEntity(Iterable<CommentCreateRequestDTO> comments);

    Comment dtoToEntity(CommentCreateRequestDTO comment);
}
