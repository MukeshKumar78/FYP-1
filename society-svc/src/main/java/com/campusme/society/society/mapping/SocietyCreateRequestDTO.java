package com.campusme.society.society.mapping;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocietyCreateRequestDTO {
  String code;
  String description;
  String name;
  String fullName;
  MultipartFile image;
}
