package com.campusme.society.society;

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

  public BaseSociety toBaseSociety() {
    return BaseSociety.builder()
      .code(code)
      .description(description)
      .name(name)
      .fullName(fullName).build();
  }
}
