package com.campusme.securitysvc.permission;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller class for operations related to Permissions
 * Mainly reserved for admins
 */
@RestController
public class PermissionController {

  @Autowired
  private PermissionRepository permissionRepository;

  @GetMapping("/permissions")
  public ResponseEntity<List<Permission>> findAll() {
    return ResponseEntity.ok(permissionRepository.findAll());
  }
}
