package com.campusme.society.event.mapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventCreateRequestDTO {
  String description;
  String title;

  // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
  // @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
  @DateTimeFormat(iso=DateTimeFormat.ISO.DATE_TIME)
  LocalDate startDate;

  // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
  Date endDate;
  String text;
  String registrationLink;
  List<MultipartFile> attachments = new ArrayList<MultipartFile>();
}
