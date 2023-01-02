package com.campusme.society.user;

import java.util.Collection;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

public class AppUserAuthenticationToken extends AbstractAuthenticationToken {

  private final AppUser societyUser;

  public AppUserAuthenticationToken(AppUser societyUser, Collection<? extends GrantedAuthority> authorities) {
    super(authorities);
    setAuthenticated(true);
    this.societyUser = societyUser;
  }

  @Override
  public Object getCredentials() {
    return null;
  }

  @Override
  public Object getPrincipal() {
    return this.societyUser;
  }
}
