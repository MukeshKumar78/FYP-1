package com.campusme.gateway.security;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campusme.gateway.service.TokenService;

@RestController
public class SecurityController {

  private final TokenService tokenService;

  public SecurityController(TokenService tokenService) {
    this.tokenService = tokenService;
  }

  @GetMapping(path = "/me")
  public Principal getUser(Principal principal) {
    return principal;
  }

  @PostMapping("/token")
  public String token(Authentication authentication) {
    Jwt jwt = tokenService.generateToken(authentication);
    return jwt.getTokenValue();
  }
}
