package com.campusme.securitysvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class SecuritySvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(SecuritySvcApplication.class, args);
	}

}
