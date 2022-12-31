package com.campusme.society.config.events;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.AuthenticationEventPublisher;
import org.springframework.security.authentication.DefaultAuthenticationEventPublisher;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationEvents {


	private final static Logger LOG = LoggerFactory.getLogger(AuthenticationEvents.class);

  public AuthenticationEvents() {
    LOG.info("Listening to Authentication Events");
  }
  
	@EventListener
    public void onSuccess(AuthenticationSuccessEvent success) {

      UserDetails user = (UserDetails) success.getAuthentication().getPrincipal();
    
      LOG.info("Sucessful Authentication: %s".formatted(user.getUsername()));
    }

  @Bean
  public AuthenticationEventPublisher authenticationEventPublisher
          (ApplicationEventPublisher applicationEventPublisher) {
      return new DefaultAuthenticationEventPublisher(applicationEventPublisher);
  }
}
