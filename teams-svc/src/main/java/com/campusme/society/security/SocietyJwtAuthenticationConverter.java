package com.campusme.society.security;

import com.campusme.society.user.SocietyUser;
import com.campusme.society.user.SocietyUserAuthenticationToken;
import com.campusme.society.user.SocietyUserDetailsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

@Component
public class SocietyJwtAuthenticationConverter implements Converter<Jwt, AbstractAuthenticationToken> {
  private final SocietyUserDetailsService userDetailsService;

  @Autowired
  public SocietyJwtAuthenticationConverter(SocietyUserDetailsService userDetailsService) {
    this.userDetailsService = userDetailsService;
  }

  @Override
  public AbstractAuthenticationToken convert(Jwt jwt) {
    UserDetails userDetails = userDetailsService.loadByPrincipal(jwt);

    if (userDetails instanceof SocietyUser) {
      return new SocietyUserAuthenticationToken((SocietyUser) userDetails,
          userDetails.getAuthorities());
    } else {
      return null;
    }
  }
}
