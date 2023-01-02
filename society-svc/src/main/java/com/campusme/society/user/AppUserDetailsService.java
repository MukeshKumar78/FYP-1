package com.campusme.society.user;
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
  private final AppUserRepository societyUserRepository;

  @Autowired
  public AppUserDetailsService(AppUserRepository societyUserRepository) {
    this.societyUserRepository = societyUserRepository;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    AppUser user = societyUserRepository.findByEmail(username);
    if (user == null) {
      throw new UsernameNotFoundException(
          "No user could be found for user name '" + username + "'");
    }
    return user;
  }

  public UserDetails loadByPrincipal(Jwt jwt) {
    AppUser user = societyUserRepository.findByEmail(jwt.getClaimAsString("email"));
    if (user == null) {
      user = new AppUser(
        jwt.getClaimAsString("name"),
        jwt.getClaimAsString("email"),
        jwt.getClaimAsString("photo")
      );
      societyUserRepository.save(user);
    }
    return user;
    
  }
}
