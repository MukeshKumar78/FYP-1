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
public class SocietyUserDetailsService implements UserDetailsService {
  private final SocietyUserRepository societyUserRepository;

  @Autowired
  public SocietyUserDetailsService(SocietyUserRepository societyUserRepository) {
    this.societyUserRepository = societyUserRepository;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    SocietyUser user = societyUserRepository.findByEmail(username);
    if (user == null) {
      throw new UsernameNotFoundException(
          "No user could be found for user name '" + username + "'");
    }
    return user;
  }

  public UserDetails loadByPrincipal(Jwt jwt) {
    SocietyUser user = societyUserRepository.findByEmail(jwt.getClaimAsString("email"));
    if (user == null) {
      user = new SocietyUser(
        jwt.getClaimAsString("name"),
        jwt.getClaimAsString("email"),
        jwt.getClaimAsString("photo")
      );
      societyUserRepository.save(user);
    }
    return user;
    
  }
}
