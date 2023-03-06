package com.campusme.gateway;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.FileSystemResource;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

import com.campusme.gateway.config.JwtConfig;

@SpringBootApplication
@EnableWebFluxSecurity
@EnableConfigurationProperties(JwtConfig.class)
public class SpringCloudGatewayApplication {

  @Value("${spring.application.name}")
  private String appName;

  @Value("${static.location}")
  private String staticFilesPath;

  public static void main(String[] args) {
    SpringApplication.run(SpringCloudGatewayApplication.class, args);
  }

  /**
   * Router for downstream services
   * 
   * @param builder
   * @return the RouteLocator
   */
  @Bean
  public RouteLocator routeLocator(RouteLocatorBuilder builder) {
    return builder.routes()
        .route("whoami", r -> r.path("/whoami")
            .uri("http://localhost:9002"))
        .route("society-api", r -> r.path("/api/core/**")
            .filters(f -> f.rewritePath("/api/core", "/"))
            .uri("lb://SOCIETY"))
        .route("teams-api", r -> r.path("/api/team/**")
            .filters(f -> f.rewritePath("/api/team", "/"))
            .uri("lb://TEAM"))
        .route("admin-panel", r -> r.path("/admin/**")
            .uri("lb://SECURITY"))
        .build();
  }

  @Bean
  RouterFunction<ServerResponse> staticResourceRouter() {
    return RouterFunctions.resources("/public/**", new FileSystemResource(staticFilesPath));
  }
}
