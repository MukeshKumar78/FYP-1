package com.campusme.society.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.campusme.society.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppUser implements UserDetails {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private String firstName;

  @Column
  private String lastName;

  @Column
  private String photo;

  @Column(unique = true)
  private String email;

  @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
  @Builder.Default
  private List<Member> memberships = new ArrayList<>();

  @Transient
  @Builder.Default
  List<String> authorities = new ArrayList<>();

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return authorities.stream()
      .map( a -> new SimpleGrantedAuthority("ROLE_" + a))
      .collect(Collectors.toList());
  }

  @Override
  public String getPassword() {
    return null;
  }

  @Override
  public String getUsername() {
    return this.email;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
