package com.campusme.teams.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * REST Controller for Users 
 */
@RestController
public class AppUserController {

  @Autowired
  private AppUserRepository userRepository;

  /**
   * Endpoint for society related user details for current user
   * 
   * @param id
   * @return {@code AppUserResponseDTO}
   */
  @GetMapping("/me")
  public AppUser me(AppUserAuthenticationToken auth) {
    AppUser user = ((AppUser) auth.getPrincipal());
    return user;
  }

  /**
   * Endpoint for society related user details 
   * 
   * @param id
   * @return {@code AppUserResponseDTO}
   */
  @GetMapping("/users/{code}")
  public AppUser findByCode(@PathVariable String code) {
    AppUser user = userRepository.findByCode(code).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "User not found"));

    return user;
  }
}
