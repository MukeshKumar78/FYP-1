package com.campusme.teams.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.campusme.teams.security.UserJwtAuthenticationConverter;

import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;

@Configuration
public class SecurityConfig {

  private final SecretKey key;
  private final UserJwtAuthenticationConverter userJwtAuthenticationConverter;

  public SecurityConfig(JwtConfig jwtConfig, UserJwtAuthenticationConverter userJwtAuthenticationConverter) {
    this.key = jwtConfig.getSecretKey();
    this.userJwtAuthenticationConverter = userJwtAuthenticationConverter;
  }

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.authorizeRequests(authorize -> authorize
        .antMatchers("/**").fullyAuthenticated())
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtAuthenticationConverter(userJwtAuthenticationConverter)
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())
            )
        );

    return http.build();
  }
}
