package com.campusme.gateway.config;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.boot.context.properties.ConfigurationPropertiesBinding;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
@ConfigurationPropertiesBinding
class SecretKeyConverter implements Converter<String, SecretKey> {
  @Override
  public SecretKey convert(String plainText) {
    byte[] plainTextBytes = plainText.getBytes();
    return new SecretKeySpec(plainTextBytes, 0, plainTextBytes.length, "HmacSHA256");
  }

}
