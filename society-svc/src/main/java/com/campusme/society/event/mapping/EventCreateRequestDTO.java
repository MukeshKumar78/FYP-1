package com.campusme.society.event.mapping;

import java.util.Date;

public record EventCreateRequestDTO (
    String description,
    String title,
    Date startDate,
    Date endDate,
    String text,
    String registrationLink) {
}
