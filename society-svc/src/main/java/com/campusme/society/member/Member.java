package com.campusme.society.member;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.campusme.society.security.role.Role;
import com.campusme.society.society.Society;
import com.campusme.society.user.SocietyUser;

@Entity
public class Member {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne
  @JoinColumn(name = "role_id")
  private Role role;

  @ManyToOne
  @JoinColumn(name = "society_id")
  private Society society;

  @ManyToOne
  @JoinColumn(name = "user_id")
  private SocietyUser user;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Role getRole() {
    return role;
  }

  public void setRole(Role role) {
    this.role = role;
  }

  public Society getSociety() {
    return society;
  }

  public void setSociety(Society society) {
    this.society = society;
  }

  public SocietyUser getUser() {
    return user;
  }

  public void setUser(SocietyUser user) {
    this.user = user;
  }
}
