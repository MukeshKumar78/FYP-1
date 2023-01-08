package com.campusme.society.member;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.campusme.society.society.Society;
import com.campusme.society.user.AppUser;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * {@code Member} connects a user, society and role and represents a society
 * membership
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Member {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  private String role;

  @ManyToOne
  @JoinColumn(name = "society_id")
  private Society society;

  @ManyToOne
  @JoinColumn(name = "user_id")
  private AppUser user;
}
