package com.campusme.teams.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import com.campusme.teams.security.UserJwtAuthenticationConverter;

import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
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
        .antMatchers("/actuator/**").permitAll()
        .antMatchers("/v3/api-docs").permitAll()
        .antMatchers("/**").fullyAuthenticated())
        .cors().and()
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtAuthenticationConverter(userJwtAuthenticationConverter)
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())
            )
        );

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
