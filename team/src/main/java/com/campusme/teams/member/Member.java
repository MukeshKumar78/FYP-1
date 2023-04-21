package com.campusme.teams.member;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.campusme.teams.team.Team;
import com.campusme.teams.teamchat.TeamChatMessage;
import com.campusme.teams.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.minidev.json.annotate.JsonIgnore;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "team_id")
  @JsonIgnoreProperties({ "memberships" })
  private Team team;

  @ManyToOne
  @JoinColumn(name = "user_id")
  @JsonIgnoreProperties({ "memberships" })
  private AppUser user;

  @JsonIgnore
  @OneToMany(mappedBy = "membership")
  private List<TeamChatMessage> messages;
}
