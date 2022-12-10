package com.campusme.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;

import com.campusme.gateway.config.JwtConfig;

@SpringBootApplication
@EnableWebFluxSecurity
@EnableConfigurationProperties(JwtConfig.class)
public class SpringCloudGatewayApplication {

  public static void main(String[] args) {
    SpringApplication.run(SpringCloudGatewayApplication.class, args);
  }

  @Bean
  public RouteLocator routeLocator(RouteLocatorBuilder builder) {
    return builder.routes()
        .route("eureka-base", r -> r.path("/eureka")
            .filters(f -> f.rewritePath("/eureka", "/"))
            .uri("http://localhost:8761"))
        .route("eureka", r -> r.path("/eureka/**")
            .uri("http://localhost:8761"))
        .route("whoami", r -> r.path("/whoami")
            .uri("http://localhost:9002"))
        .build();
  }
}
