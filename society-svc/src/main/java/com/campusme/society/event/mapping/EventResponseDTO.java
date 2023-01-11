package com.campusme.society.event.mapping;

import java.util.Date;
import java.util.List;

import com.campusme.society.society.mapping.SocietyResponseDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventResponseDTO {
    Long id;
    String code;
    String description;
    String title;
    Date createdAt;
    Date publishedAt;
    Date startDate;
    Date endDate;
    List<String> attachments;
    boolean published;
    String text;
    // String registrationLink;
    SocietyResponseDTO society;
}
