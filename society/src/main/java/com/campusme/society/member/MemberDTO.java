package com.campusme.society.member;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
class MemberCreateRequestDTO {
  @NotBlank(message = "user is required")
  String user;
  @NotBlank(message = "society is required")
  String society;
  @NotBlank(message = "role is required")
  String role;
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class MemberRemoveRequestDTO {
  @NotBlank(message = "user is required")
  String user;
  @NotBlank(message = "society is required")
  String society;
}
