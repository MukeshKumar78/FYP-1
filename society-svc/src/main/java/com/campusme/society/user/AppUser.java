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

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import com.campusme.society.member.Member;

@Entity
public class AppUser  implements UserDetails {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private String name;

  @Column
  private String photo;

  @Column(unique = true)
  private String email;

  @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
  private List<Member> memberships = new ArrayList<>();


  public AppUser() {
  }

  public AppUser(long id, String name, String email, String photo, List<String> roles) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.photo = photo;
  }

  public AppUser(String name, String email, String photo) {
    this.name = name;
    this.email = email;
    this.photo = photo;
  }

  public long getId() {
    return this.id;
  }

  public String getName() {
    return this.name;
  }

  public String setName(String name) {
    return this.name = name;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getEmail() {
    return this.email;
  }

  public String setEmail(String email) {
    return this.email = email;
  }

  public List<Member> getMemberships() {
    return memberships;
  }

  public void setMemberships(List<Member> memberships) {
    this.memberships = memberships;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    if (memberships.isEmpty())
      return Collections.emptyList();

    return AuthorityUtils.createAuthorityList(
        memberships.stream()
            .map(m -> "ROLE_" + m.getSociety().getCode() + "_" + m.getRole().getCode())
            .collect(Collectors.joining()));
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
