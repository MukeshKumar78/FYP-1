package com.campusme.teams.member;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.campusme.teams.security.role.Role;
import com.campusme.teams.user.AppUser;

@Entity
public class Member {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @ManyToOne
  @JoinColumn(name="role_id")
  private Role role;

  @ManyToOne
  @JoinColumn(name="user_id")
  private AppUser user;
}
