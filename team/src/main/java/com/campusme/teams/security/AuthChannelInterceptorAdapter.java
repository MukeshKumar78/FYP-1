package com.campusme.teams.security;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompHeaders;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.ChannelInterceptorAdapter;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.stereotype.Component;
import com.campusme.teams.user.AppUserDetailsService;
import com.campusme.teams.user.AppUser;
import com.campusme.teams.user.AppUserAuthenticationToken;

@Component
public class AuthChannelInterceptorAdapter implements ChannelInterceptor {
  @Autowired
  AppUserDetailsService appUserDetailsService;
  @Autowired
  private JwtDecoder decoder;

  @Override
  public Message<?> preSend(final Message<?> message, final MessageChannel channel) {
    final StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);

    if (StompCommand.CONNECT == accessor.getCommand()) {
      AppUserAuthenticationToken token = this.authenticateAuthorizationHeader(accessor);
      accessor.setUser(token);
    }

    if (StompCommand.SUBSCRIBE == accessor.getCommand()) {
      AppUser user = (AppUser) this.authenticateAuthorizationHeader(accessor).getPrincipal();
    }

    return message;
  }

  private AppUserAuthenticationToken authenticateAuthorizationHeader(StompHeaderAccessor accessor) {
    final String auth = accessor.getFirstNativeHeader("Authorization");

    Jwt jwt = decoder.decode(auth);
    UserDetails userDetails = appUserDetailsService.loadByPrincipal(jwt);

    if (userDetails instanceof AppUser user) {
      AppUserAuthenticationToken token = new AppUserAuthenticationToken(user, user.getAuthorities());
      return token;
    } else {
      return null;
    }
  }
}
