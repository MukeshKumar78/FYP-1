package com.campusme.gateway.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.core.userdetails.MapReactiveUserDetailsService;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.jwt.NimbusReactiveJwtDecoder;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.util.matcher.PathPatternParserServerWebExchangeMatcher;

import com.campusme.gateway.security.AuthenticationSuccessHandler;

/**
 * Security configuration with 2 filter chains: external and internal
 */
@Configuration
public class SecurityConfig {

  private SecretKey key;
  private AuthenticationSuccessHandler successHandler;

  public SecurityConfig(JwtConfig jwtConfig, AuthenticationSuccessHandler successHandler) {
    this.key = jwtConfig.getSecretKey();
    this.successHandler = successHandler;
  }

  /**
   * External JWT security for the {@code /token} route
   * 
   * @param http
   * @return the SecurityWebFilterChain
   * @throws Exception
   */
  @Bean
  @Order(1)
  public SecurityWebFilterChain loginFilterChain(ServerHttpSecurity http) throws Exception {
    http
        .securityMatcher(new PathPatternParserServerWebExchangeMatcher("/token"))
        .oauth2ResourceServer().jwt()
        .and()
        .and()
        .cors().and().csrf().disable();

    return http.build();
  }

  /**
   * Internal JWT security for {@code /me} and downstream services routed through
   * the gateway.
   * Uses {@link com.campusme.gateway.config.SecurityConfig#jwtEncoder()}
   *
   * @param http
   * @return the SecurityWebFilterChain
   * @throws Exception
   */
  @Bean
  @Order(2)
  public SecurityWebFilterChain filterChain(ServerHttpSecurity http) throws Exception {
    http
        .authorizeExchange((exchanges) -> exchanges
            .pathMatchers("/admin/**")
            .hasRole("ADMIN")
            .and()
            .formLogin()
            .authenticationSuccessHandler(successHandler))
        .authorizeExchange((exchanges) -> exchanges
            .pathMatchers("/public/**")
            .permitAll()
            .anyExchange().authenticated())
        .securityMatcher(new PathPatternParserServerWebExchangeMatcher("/**"))
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtDecoder(NimbusReactiveJwtDecoder.withSecretKey(key).build())))
        .cors().and().csrf().disable();

    return http.build();
  }

  /**
   * Create a UserDetailsService bean with the default admin user
   * 
   * @return MapReactiveUserDetailsService with one admin user
   */
  @Bean
  public MapReactiveUserDetailsService userDetailsService() {
    UserDetails admin = User.builder()
        .username("admin")
        .password(passwordEncoder().encode("admin"))
        .roles("ADMIN")
        .build();

    return new MapReactiveUserDetailsService(admin);
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }
}
