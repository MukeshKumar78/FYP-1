package com.campusme.teams.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;

@Primary
@Service
public class AppUserDetailsService implements UserDetailsService {
  private final AppUserRepository appUserRepository;
  @Autowired
  public AppUserDetailsService(AppUserRepository appUserRepository) {
    this.appUserRepository = appUserRepository;
  }
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    AppUser user = appUserRepository.findByEmail(username);
    if (user == null) {
      throw new UsernameNotFoundException(
          "No user could be found for user name '" + username + "'");
    }
    return user;
  }

  public UserDetails loadByPrincipal(Jwt jwt) {
    AppUser user = appUserRepository.findByEmail(jwt.getClaimAsString("email"));
    if (user == null) {
      user = new AppUser(
        jwt.getClaimAsString("name"),
        jwt.getClaimAsString("email"),
        jwt.getClaimAsString("photo")
      );
      appUserRepository.save(user);
    }
    return user;
    
  }
}
