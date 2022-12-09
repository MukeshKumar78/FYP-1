package com.campusme.gateway.security;

import java.security.Principal;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.OAuth2AccessToken.TokenType;
import org.springframework.security.oauth2.core.endpoint.OAuth2AccessTokenResponse;
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
    public OAuth2AccessTokenResponse token(Authentication authentication) {
        Jwt jwt = tokenService.generateToken(authentication);

        return OAuth2AccessTokenResponse
          .withToken(jwt.getTokenValue())
          .tokenType(TokenType.BEARER)
          .expiresIn(ChronoUnit.SECONDS.between(Instant.now(), jwt.getExpiresAt()))
          .build();
    }
}
