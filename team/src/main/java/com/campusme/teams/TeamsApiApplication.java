package com.campusme.teams;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.campusme.teams.config.JwtConfig;

@SpringBootApplication
@EnableFeignClients
@EnableJpaAuditing
@EnableConfigurationProperties(JwtConfig.class)
public class TeamsApiApplication {
  public static void main(String[] args) {
    SpringApplication.run(TeamsApiApplication.class, args);
  }
}
