package com.campusme.society.society;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SocietyMuteId implements Serializable {
  private Long societyId;
  private Long userId;
}
