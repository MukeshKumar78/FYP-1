package com.campusme.society.event;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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

  @NotBlank(message = "title is required")
  @Size(min = 5, max = 25, message = "title size must be between 5 and 25")
  String title;

  // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
  // @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
  @NotNull(message = "startDate is required")
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
  @Future(message = "startDate must be in the future")
  Date startDate;

  // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
  @Future(message = "endDate must be in the future")
  Date endDate;

  @NotBlank(message = "text is required")
  @Size(min = 5, max = 1000, message = "text size must be between 5 and 1000")
  String text;

  String registrationLink;

  List<MultipartFile> attachments = new ArrayList<MultipartFile>();

  @AssertTrue(message = "end date must be after start date")
  public boolean isEndDateGreater() {
    if (endDate == null)
      return true;

    return endDate.compareTo(startDate) > 0;
  }

  public Event toEvent() {
    return Event.builder()
      .description(description)
      .title(title)
      .startDate(startDate)
      .endDate(endDate)
      .text(text)
      .registrationLink(registrationLink).build();
  }
}
