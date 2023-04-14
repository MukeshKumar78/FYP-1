package com.campusme.society.notifications;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Notification implements Serializable {
  String title;
  String body;
}
