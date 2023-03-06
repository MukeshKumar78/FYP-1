package com.campusme.society.config;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesBinding;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

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
}

/**
 * Configuration class used to convert jwt key provided in application.yml
 * to a javax.crypto.SecretKey object
 */
@Component
@ConfigurationPropertiesBinding
class SecretKeyConverter implements Converter<String, SecretKey> {

  @Override
  public SecretKey convert(String plainText) {
    byte[] plainTextBytes = plainText.getBytes();
    return new SecretKeySpec(plainTextBytes, 0, plainTextBytes.length, "HmacSHA256");
  }
}
