package com.campusme.society.event;

import java.util.Date;

/**
 * Data transfer object for {@link com.campusme.society.event.Event}
 */
public class EventDto {
  private String code;
  private String description;
  private String title;
  private Date startDate;
  private Date endDate;
  private boolean published;
  private String text;
  private String registrationLink;

  public String getCode() {
    return code;
  }

  public String getDescription() {
    return description;
  }

  public String getTitle() {
    return title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public boolean isPublished() {
    return published;
  }

  public String getText() {
    return text;
  }

  public String getRegistrationLink() {
    return registrationLink;
  }
}
