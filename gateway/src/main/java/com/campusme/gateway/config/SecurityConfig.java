package com.campusme.gateway.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;

@Configuration
public class SecurityConfig {

  private final SecretKey key;

  public SecurityConfig(JwtConfig jwtConfig) {
    this.key = jwtConfig.getSecretKey();
  }

  // External JWT security for login routes
  @Bean
  @Order(1)
  public SecurityFilterChain loginFilterChain(HttpSecurity http) throws Exception {
    http
        .antMatcher("/token")
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        .and()
        .oauth2ResourceServer().jwt()
        .and()
        .and()
        .cors().and().csrf().disable();

    return http.build();
  }

  // Internal JWT security
  @Bean
  @Order(2)
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http.authorizeRequests(authorize -> authorize
        .antMatchers("/**").fullyAuthenticated())
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())));

    return http.build();
  }

  @Bean
  public JwtEncoder jwtEncoder() {
    JWKSource<SecurityContext> jwks = new ImmutableSecret<SecurityContext>(key);
    return new NimbusJwtEncoder(jwks);
  }

}
