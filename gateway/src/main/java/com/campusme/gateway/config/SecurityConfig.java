package com.campusme.gateway.config;

import javax.crypto.SecretKey;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusReactiveJwtDecoder;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.util.matcher.PathPatternParserServerWebExchangeMatcher;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;

/**
 * Security configuration with 2 filter chains: external and internal
 */
@Configuration
public class SecurityConfig {

  private final SecretKey key;

  public SecurityConfig(JwtConfig jwtConfig) {
    this.key = jwtConfig.getSecretKey();
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
            .anyExchange().authenticated())
        .securityMatcher(new PathPatternParserServerWebExchangeMatcher("/**"))
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .jwtDecoder(NimbusReactiveJwtDecoder.withSecretKey(key).build())))
        .cors().and().csrf().disable();

    return http.build();
  }

  /**
   * @return NimbusJwtEncoder using {@code jwt.secret-key} from application properties
   */
  @Bean
  public JwtEncoder jwtEncoder() {
    JWKSource<SecurityContext> jwks = new ImmutableSecret<SecurityContext>(key);
    return new NimbusJwtEncoder(jwks);
  }

}
