package com.campusme.securitysvc.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller class for operations related to Roles
 * Used by other services for authorization
 */
@RestController
public class RoleController {

  @Autowired
  private RoleRepository roleRepository;

  @GetMapping("/roles/{code}")
  public ResponseEntity<Role> findByCode(@PathVariable String code) {
    return ResponseEntity.ok(roleRepository.findByCode(code));
  }

  @GetMapping("/roles")
  public ResponseEntity<List<Role>> findAll() {
    return ResponseEntity.ok(roleRepository.findAll());
  }
}
