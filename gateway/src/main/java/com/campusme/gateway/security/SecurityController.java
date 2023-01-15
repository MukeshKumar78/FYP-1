package com.campusme.gateway.security;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campusme.gateway.service.TokenService;

class JwtResponse {
  private String token;

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public JwtResponse(String token) {
    this.token = token;
  }
}

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
   * @param principal The Spring Security Principal object
   * @return Authenticated user's data
   */
  @GetMapping(path = "/me")
  public Object getUser(Principal principal) {
    return principal;
  }

  /**
   * Endpoint used to exchange external provider idtoken with internal JWT
   * 
   * @param authentication The Spring Security authentication object
   * @return jwt
   */
  @PostMapping("/token")
  public JwtResponse token(Authentication authentication) {
    Jwt jwt = tokenService.generateToken((Jwt) authentication.getPrincipal());
    return new JwtResponse(jwt.getTokenValue());
  }
}
