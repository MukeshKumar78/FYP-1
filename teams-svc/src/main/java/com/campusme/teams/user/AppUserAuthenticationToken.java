package com.campusme.teams.user;

import java.util.Collection;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

public class AppUserAuthenticationToken extends AbstractAuthenticationToken {

  private final AppUser appUser;

  public AppUserAuthenticationToken(AppUser appUser, Collection<? extends GrantedAuthority> authorities) {
    super(authorities);
    setAuthenticated(true);
    this.appUser = appUser;
  }

  @Override
  public Object getCredentials() {
    return null;
  }

  @Override
  public Object getPrincipal() {
    return this.appUser;
  }
}
