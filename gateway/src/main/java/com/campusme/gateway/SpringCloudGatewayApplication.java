package com.campusme.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;

@EnableEurekaClient
@SpringBootApplication
public class SpringCloudGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudGatewayApplication.class, args);
    }

    @Bean
    public RouteLocator routeLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("eureka-base", r ->
                    r.path("/eureka")
                    .filters(f -> f.rewritePath("/eureka", "/"))
                    .uri("http://localhost:8761"))
                .route("eureka", r ->
                    r.path("/eureka/**")
                    .uri("http://localhost:8761"))
                .route("whoami", r ->
                    r.path("/whoami")
                    .uri("http://localhost:9002"))
                .build();
    }
}