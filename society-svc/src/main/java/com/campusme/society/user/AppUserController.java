package com.campusme.society.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.user.mapping.AppUserMapper;
import com.campusme.society.user.mapping.AppUserResponseDTO;

/**
 * REST Controller for Users 
 */
@RestController
public class AppUserController {

  @Autowired
  private AppUserRepository userRepository;

  @Autowired
  private AppUserMapper mapper;

  /**
   * Endpoint for society related user details 
   * 
   * @param id
   * @return {@code AppUserResponseDTO}
   */
  @GetMapping("/users/{id}")
  public AppUserResponseDTO findById(@PathVariable Long id) {
    AppUser user = userRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "User not found"));

    return mapper.entityToDTO(user);
  }
}
