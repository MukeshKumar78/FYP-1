package com.campusme.society.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.Data;

@Data
class Role {
  private String code;
  private List<Permission> permissions;
  private Integer precedence;

  public String getCode() {
    return code;
  }

  public List<Permission> getPermissions() {
    return permissions;
  }
}

@Data
class Permission {
  private String code;
  private String target;
  private String permission;

  public String getCode() {
    return code;
  }

  public String getTarget() {
    return target;
  }

  public String getPermission() {
    return permission;
  }


}

/**
 * HTTP API client for roles in the SECURITY service
 */
@FeignClient("SECURITY")
interface FeignRoleClient {
  @GetMapping("/admin/roles")
  @CrossOrigin
  List<Role> readRoles();

  @GetMapping("/admin/roles/{code}")
  @CrossOrigin
  Role readRole(@PathVariable String code);
}

/**
 * Encapsulates the Feign HTTP API client and provides role-related methods
 */
@Service
public class RoleService {

  @Autowired
  private final FeignRoleClient roleClient;

  public RoleService(FeignRoleClient roleClient) {
    this.roleClient = roleClient;
  }


  public List<String> getRoles() {
    return roleClient.readRoles().stream().map(r -> r.getCode()).toList();
  }

  public boolean hasPermission(String role, String target, String permission) {
    List<Permission> permissions = roleClient.readRole(role).getPermissions();

    return permissions.stream()
        .anyMatch(p -> p.getPermission().equals(permission) && p.getTarget().equals(target));
  }

  public boolean isHigher(String first, String second) {
    Role firstRole = roleClient.readRole(first);
    Role secondRole = roleClient.readRole(second);

    return firstRole.getPrecedence() > secondRole.getPrecedence();
  }

  public List<String> getPermissions(String role) {
    List<Permission> permissions = roleClient.readRole(role).getPermissions();
    return permissions.stream().map(p -> p.getTarget() + "_" + p.getPermission()).toList();
  }
}
