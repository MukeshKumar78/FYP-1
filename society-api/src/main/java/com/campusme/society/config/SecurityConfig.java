package com.campusme.society.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.campusme.society.security.SocietyJwtAuthenticationConverter;

import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;

@Configuration
public class SecurityConfig {

  private final SecretKey key;
  private final SocietyJwtAuthenticationConverter societyJwtAuthenticationConverter;

  public SecurityConfig(JwtConfig jwtConfig, SocietyJwtAuthenticationConverter societyJwtAuthenticationConverter) {
    this.key = jwtConfig.getSecretKey();
    this.societyJwtAuthenticationConverter = societyJwtAuthenticationConverter;
  }

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.authorizeRequests(authorize -> authorize
        .antMatchers("/**").fullyAuthenticated())
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtAuthenticationConverter(societyJwtAuthenticationConverter)
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())
            )
        );

    return http.build();
  }
}
