package com.campusme.securitysvc.society;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocietyCreateDTO {
  String code;
  String description;
  String name;
  String fullName;
  MultipartFile image;
}
