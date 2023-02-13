package com.campusme.society.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;

/**
 * Custom UserDetails Service that provides a loadByPrincipal method
 * <br>
 * retrieves and update AppUsers from the database
 */
@Primary
@Service
public class AppUserDetailsService implements UserDetailsService {
  private final AppUserRepository userRepository;

  @Autowired
  public AppUserDetailsService(AppUserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    AppUser user = userRepository.findByEmail(username).orElseThrow(
        () -> new UsernameNotFoundException(
            "No user could be found for user name '" + username + "'"));

    return user;
  }

  /**
   * 1. Retrieves user from database by email<br>
   * 2. Creates user in database from JWT if it doesn't exist already
   *
   * @param jwt
   * @return AppUser
   */
  public UserDetails loadByPrincipal(Jwt jwt) {
    List<String> roles = jwt.getClaimAsStringList("roles");
    if(roles.contains("USER")) {
      AppUser user = userRepository
          .findByCode(jwt.getSubject())
          .orElseGet(
              () -> userRepository.save(
                  AppUser.builder()
                      .code(jwt.getSubject())
                      .email(jwt.getSubject())
                      .firstName(jwt.getClaimAsString("given_name"))
                      .lastName(jwt.getClaimAsString("family_name"))
                      .photo(jwt.getClaimAsString("picture"))
                      .build()));
      user.setAuthorities(roles);
      return user;
    } else {
      return AppUser.builder()
        .code(jwt.getSubject())
        .firstName(jwt.getSubject())
        .authorities(roles)
        .build();
    }
  }
}
