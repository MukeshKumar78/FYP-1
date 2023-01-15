package com.campusme.gateway.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.server.WebFilterExchange;
import org.springframework.security.web.server.authentication.ServerAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.campusme.gateway.service.TokenService;

import reactor.core.publisher.Mono;



@Component
public class AuthenticationSuccessHandler implements ServerAuthenticationSuccessHandler {

  @Autowired
  private TokenService tokenService;

  @Override
  public Mono<Void> onAuthenticationSuccess(
      WebFilterExchange exchange,
      Authentication authentication) {

    // Add a session cookie
    ResponseCookie sessionCookie = ResponseCookie
    .from("_token", tokenService.generateToken(authentication).getTokenValue())
    .httpOnly(true)
    .sameSite("Lax").build();

    exchange.getExchange().getResponse().addCookie(sessionCookie);
    return Mono.empty();
  }
}
