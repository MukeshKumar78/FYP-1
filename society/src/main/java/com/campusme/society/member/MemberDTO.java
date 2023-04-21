package com.campusme.society.member;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
class MemberCreateRequestDTO {
  @NotBlank(message = "User is required")
  String user;
  @NotBlank(message = "Society is required")
  String society;
  @NotBlank(message = "Role is required")
  String role;
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class MemberRemoveRequestDTO {
  @NotBlank(message = "User is required")
  String user;
  @NotBlank(message = "Society is required")
  String society;
}
