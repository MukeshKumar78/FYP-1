package com.campusme.society.society.mapping;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TenureResponseDTO {
  Long id;
  String code;
  String description;
  String duration;
  Date createdAt;
  Boolean archived;
  List<SocietyResponseDTO> societies;
}
