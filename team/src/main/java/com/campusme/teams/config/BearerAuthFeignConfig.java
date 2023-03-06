package com.campusme.teams.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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

    return req.getHeader("Authorization");
  }

  @Bean
  public RequestInterceptor bearerAuthRequestInterceptor() {
    return requestTemplate -> {
      requestTemplate.header("Authorization", getBearerToken());
    };
  }
}
