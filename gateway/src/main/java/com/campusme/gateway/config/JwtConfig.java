package com.campusme.gateway.config;

import javax.crypto.SecretKey;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;

/**
 * Configuration class to read jwt secret key from application.yaml
 */
@ConfigurationProperties(prefix = "jwt")
@ConfigurationPropertiesScan
public class JwtConfig {
  private SecretKey secretKey;

  public SecretKey getSecretKey() {
    return secretKey;
  }

  public void setSecretKey(SecretKey secretKey) {
    this.secretKey = secretKey;
  }

  /**
   * @return NimbusJwtEncoder using {@code jwt.secret-key} from application
   *         properties
   */
  @Bean
  public JwtEncoder jwtEncoder() {
    JWKSource<SecurityContext> jwks = new ImmutableSecret<SecurityContext>(secretKey);
    return new NimbusJwtEncoder(jwks);
  }
}
