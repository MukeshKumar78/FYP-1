package com.campusme.society.comment.mapping;

import java.util.Date;

import com.campusme.society.event.mapping.EventResponseDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentResponseDTO {
    Long id;
    String code;
    String text;
    Date createdAt;
    EventResponseDTO event;
}
