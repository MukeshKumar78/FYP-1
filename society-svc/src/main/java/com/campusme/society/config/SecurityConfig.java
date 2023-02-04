package com.campusme.society.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import com.campusme.society.security.UserJwtAuthenticationConverter;

import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;

/**
 * Security configuration with 1 filter chain for jwt authentication
 */
@Configuration
public class SecurityConfig {

  private final SecretKey key;
  private final UserJwtAuthenticationConverter userJwtAuthenticationConverter;

  public SecurityConfig(JwtConfig jwtConfig, UserJwtAuthenticationConverter userJwtAuthenticationConverter) {
    this.key = jwtConfig.getSecretKey();
    this.userJwtAuthenticationConverter = userJwtAuthenticationConverter;
  }

  /**
   * Internal JWT security for all routes
   * Uses custom JWT Encoder using secret key from properties
   * 
   * @param http
   * @return the SecurityWebFilterChain
   * @throws Exception
   */
  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http.authorizeRequests(authorize -> authorize
        .antMatchers("/actuator/**").permitAll()
        .antMatchers("/v3/api-docs").permitAll()
        .antMatchers("/**").fullyAuthenticated())
        .cors().and()
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtAuthenticationConverter(userJwtAuthenticationConverter)
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())))
        .cors().and().csrf().disable();

    return http.build();
  }

  @Bean
  public CorsFilter corsFilter() {
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

    // Allow anyone and anything access. Probably ok for Swagger spec
    CorsConfiguration config = new CorsConfiguration();
    config.setAllowCredentials(true);
    config.addAllowedOriginPattern("*");
    config.addAllowedHeader("*");
    config.addAllowedMethod("*");

    source.registerCorsConfiguration("/v3/api-docs", config);
    return new CorsFilter(source);
  }
}
