package com.campusme.society.society.mapping;

import java.util.Date;

public record SocietyResponseDTO (
    Long id,
    String code,
    String description,
    String title,
    String image,
    Date createdAt,
    TenureResponseDTO tenure
) {
}
