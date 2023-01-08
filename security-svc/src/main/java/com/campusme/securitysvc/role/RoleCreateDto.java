package com.campusme.securitysvc.role;

import java.util.ArrayList;

class RoleCreateDTO {
  Long id;
  String code;
  String description;
  String name;
  ArrayList<PermissionWithSelection> permissionCodeList;

  public RoleCreateDTO() {
  }

  public RoleCreateDTO(Long id, String code, String description, String name,
      ArrayList<PermissionWithSelection> permissionCodeList) {
    this.id = id;
    this.code = code;
    this.description = description;
    this.name = name;
    this.permissionCodeList = permissionCodeList;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public ArrayList<PermissionWithSelection> getPermissionCodeList() {
    return permissionCodeList;
  }

  public void setPermissionCodeList(ArrayList<PermissionWithSelection> permissionCodeList) {
    this.permissionCodeList = permissionCodeList;
  }

}

class PermissionWithSelection {
  Boolean selected;
  String code;

  public PermissionWithSelection(Boolean selected, String code) {
    this.selected = selected;
    this.code = code;
  }

  public PermissionWithSelection() {
  }

  public Boolean getSelected() {
    return selected;
  }

  public void setSelected(Boolean selected) {
    this.selected = selected;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }
}
