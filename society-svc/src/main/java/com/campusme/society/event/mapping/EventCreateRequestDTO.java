package com.campusme.society.event.mapping;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventCreateRequestDTO {
  String description;
  String title;
  Date startDate;
  Date endDate;
  String text;
  String registrationLink;
}
