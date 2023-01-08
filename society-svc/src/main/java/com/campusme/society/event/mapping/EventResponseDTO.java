package com.campusme.society.event.mapping;

import java.util.Date;

import com.campusme.society.society.mapping.SocietyResponseDTO;

public record EventResponseDTO(
    Long id,
    String code,
    String description,
    String title,
    Date createdAt,
    Date publishedAt,
    Date startDate,
    Date endDate,
    boolean published,
    String text,
    String registrationLink,
    SocietyResponseDTO society
// MemberResponseDto createdBy
// List<PostResponseDto> posts
// List<CommentResponseDto> comments
) {
}
