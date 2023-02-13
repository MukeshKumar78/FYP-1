package com.campusme.securitysvc.role;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoleCreateDTO {
  Long id;
  String code;
  String description;
  String name;
  Integer precedence;
  ArrayList<PermissionWithSelection> permissionCodeList;
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class PermissionWithSelection {
  Boolean selected;
  String code;
}
