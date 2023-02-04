package com.campusme.securitysvc.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.server.ResponseStatusException;

import feign.RequestInterceptor;

public class BearerAuthFeignConfig {

  public static HttpServletRequest getCurrentHttpRequest() {
    RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
    if (requestAttributes instanceof ServletRequestAttributes) {
      HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
      return request;
    }
    return null;
  }

  private String getBearerToken() {
    HttpServletRequest req = getCurrentHttpRequest();

    String token = "";
    for (var cookie : req.getCookies()) {
      if (cookie.getName().equals("_token")) {
        token = cookie.getValue();
      }
    }
    if (token.isEmpty())
      throw new ResponseStatusException(
          HttpStatus.UNAUTHORIZED);

    return "Bearer " + token;
  }

  @Bean
  public RequestInterceptor bearerAuthRequestInterceptor() {
    return requestTemplate -> {
      requestTemplate.header("Authorization", getBearerToken());
    };
  }
}
