package com.campusme.gateway.service;

import java.time.Instant;
import java.time.temporal.ChronoUnit;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.JwsHeader;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Service;

@Service
public class TokenService {

  private final JwtEncoder encoder;

  public TokenService(JwtEncoder encoder) {
    this.encoder = encoder;
  }

  public Jwt generateToken(Authentication authentication) {
    Instant now = Instant.now();

    Jwt userClaims = (Jwt) authentication.getPrincipal();

    // TODO: see if other oauth2 providers have same claims
    JwtClaimsSet claims = JwtClaimsSet.builder()
        .issuer("http://localhost")
        .issuedAt(now)
        .expiresAt(now.plus(1, ChronoUnit.HOURS))
        .subject(authentication.getName())
        .claim("given_name", userClaims.getClaimAsString("given_name"))
        .claim("family_name", userClaims.getClaimAsString("family_name"))
        .claim("picture", userClaims.getClaimAsString("picture"))
        .build();

    return this.encoder.encode(JwtEncoderParameters.from(
        JwsHeader.with(() -> "HS256").build(),
        claims));
  }
}
