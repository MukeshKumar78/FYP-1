package com.campusme.society.security;

import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import com.campusme.society.user.AppUserDetailsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

/**
 * Custom Authentication converter to get an {@link com.campusme.society.user.AppUser} object in Spring Security Context
 */
@Component
public class UserJwtAuthenticationConverter implements Converter<Jwt, AbstractAuthenticationToken> {
  private final AppUserDetailsService userDetailsService;

  @Autowired
  public UserJwtAuthenticationConverter(AppUserDetailsService userDetailsService) {
    this.userDetailsService = userDetailsService;
  }

  @Override
  public AbstractAuthenticationToken convert(Jwt jwt) {
    UserDetails userDetails = userDetailsService.loadByPrincipal(jwt);

    if (userDetails instanceof AppUser user) {
      return new AppUserAuthenticationToken(user,
          user.getAuthorities());
    } else {
      return null;
    }
  }
}
