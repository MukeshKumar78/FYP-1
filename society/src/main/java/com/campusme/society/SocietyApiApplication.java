package com.campusme.society;


import org.springdoc.core.SpringDocUtils;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.campusme.society.config.JwtConfig;
import com.campusme.society.event.Event;
import com.fasterxml.jackson.annotation.JsonIgnore;

@SpringBootApplication
@EnableConfigurationProperties(JwtConfig.class)
@EnableJpaAuditing
@EnableFeignClients
public class SocietyApiApplication {

  public static void main(String[] args) {
    SpringApplication.run(SocietyApiApplication.class, args);
  }

  @Bean
  public ApplicationRunner buildIndex(Indexer indexer) throws Exception {
    return (ApplicationArguments args) -> {
      indexer.indexPersistedData(Event.class);
    };
  }

  @Bean
  public ApplicationRunner springDocConfig() {
		return (ApplicationArguments args) -> {
      SpringDocUtils.getConfig().addAnnotationsToIgnore(JsonIgnore.class);
    };
  }
}
