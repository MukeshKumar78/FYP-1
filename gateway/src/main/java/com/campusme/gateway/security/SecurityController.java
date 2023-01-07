package com.campusme.gateway.security;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campusme.gateway.service.TokenService;

/**
 * REST controller for security related endpoints
 */
@RestController
public class SecurityController {

  private final TokenService tokenService;

  public SecurityController(TokenService tokenService) {
    this.tokenService = tokenService;
  }

  /**
   * @param authentication
   * @return Authenticated user's data
   */
  @GetMapping(path = "/me")
  public String getUser(Principal principal) {
    // TODO: Batch data from downstream services
    return principal.getName();
  }

  /**
   * Endpoint used to exchange external provider idtoken with internal JWT
   * @param authentication
   * @return jwt
   */
  @PostMapping("/token")
  public String token(Authentication authentication) {
    Jwt jwt = tokenService.generateToken(authentication);
    return jwt.getTokenValue();
  }
}
