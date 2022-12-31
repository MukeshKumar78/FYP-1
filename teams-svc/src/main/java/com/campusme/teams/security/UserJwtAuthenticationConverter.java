package com.campusme.teams.security;

import com.campusme.teams.user.AppUser;
import com.campusme.teams.user.AppUserAuthenticationToken;
import com.campusme.teams.user.AppUserDetailsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

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

    if (userDetails instanceof AppUser) {
      return new AppUserAuthenticationToken((AppUser) userDetails,
          userDetails.getAuthorities());
    } else {
      return null;
    }
  }
}
