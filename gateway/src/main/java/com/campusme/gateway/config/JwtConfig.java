package com.campusme.gateway.config;

import javax.crypto.SecretKey;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

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
}
