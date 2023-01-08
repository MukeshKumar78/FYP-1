package com.campusme.society;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.campusme.society.config.JwtConfig;

@SpringBootApplication
@EnableConfigurationProperties(JwtConfig.class)
@EnableJpaAuditing
@EnableFeignClients
public class SocietyApiApplication {
	public static void main(String[] args) {
		SpringApplication.run(SocietyApiApplication.class, args);
	}
}
