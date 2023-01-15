package com.campusme.gateway.service;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;
import java.util.Map.Entry;
import java.util.stream.Collectors;

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
  private final List<String> claimsToInclude = Arrays.asList(
      "given_name",
      "family_name",
      "picture");

  public TokenService(JwtEncoder encoder) {
    this.encoder = encoder;
  }

  /**
   * Generates JWT from the Authentication object <br>
   * Includes only subject and role claims
   * 
   * @param authentication The Spring Security Authentication object
   */
  public Jwt generateToken(Authentication authentication) {
    return generateToken(JwtClaimsSet.builder()
        .subject(authentication.getName())
        .claim("roles", authentication.getAuthorities().stream()
            .filter(a -> a.getAuthority().startsWith("ROLE_"))
            .map(a -> a.getAuthority().replace("ROLE_", "")).toList()));
  }

  /**
   * Generates JWT using an existing one (e.g. Google OAuth IdToken) <br>
   * Includes whitelisted claims defined in {@code this.claimsToInclude}
   * 
   * @param jwt the existing Jwt
   */
  public Jwt generateToken(Jwt jwt) {
    return generateToken(
        JwtClaimsSet.builder()
            .subject(jwt.getClaimAsString("email"))
            .claims(map -> map.putAll(jwt
                .getClaims().entrySet().stream()
                .filter(claim -> claimsToInclude.contains(claim.getKey()))
                .collect(Collectors.toMap(Entry::getKey, Entry::getValue))))
            .claim("roles", Arrays.asList("USER")));
  }

  /**
   * Private method to build the final JWT using provided claims <br>
   * Adds issuer, issue date, expiry date and signs the token
   * 
   * @param claims a JwtClaimsSet.Builder
   */
  private Jwt generateToken(JwtClaimsSet.Builder claims) {
    Instant now = Instant.now();

    return this.encoder.encode(JwtEncoderParameters.from(
        JwsHeader.with(() -> "HS256").build(),
        claims
            .issuer("campusme")
            .issuedAt(now)
            .expiresAt(now.plus(1, ChronoUnit.HOURS))
            .build()));
  }
}
