package com.campusme.teams;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.campusme.teams.config.JwtConfig;

@SpringBootApplication
@EnableConfigurationProperties(JwtConfig.class)
public class TeamsApiApplication {
	public static void main(String[] args) {
		SpringApplication.run(TeamsApiApplication.class, args);
	}
}