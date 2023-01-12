package com.campusme.society.post.mapping;

import java.util.Date;
import java.util.List;

import com.campusme.society.event.mapping.EventResponseDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostResponseDTO {
    Long id;
    String code;
    String text;
    Date createdAt;
    List<String> attachments;
    EventResponseDTO event;
}
