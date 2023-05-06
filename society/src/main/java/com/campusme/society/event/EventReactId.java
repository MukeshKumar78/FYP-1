package com.campusme.society.event;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EventReactId implements Serializable {
  private Long eventId;
  private Long userId;
}
