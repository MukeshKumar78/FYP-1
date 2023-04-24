package com.campusme.teams.team;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import com.campusme.teams.member.Member;
import com.campusme.teams.teamchat.TeamChatMessage;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Team {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true, nullable = false)
  private String code;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private String society;

  @OneToMany(mappedBy = "team", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
  @Builder.Default
  @JsonIgnoreProperties({ "team" })
  private List<Member> memberships = new ArrayList<>();

  @JsonIgnore
  @OneToMany(mappedBy = "team", cascade = CascadeType.DETACH)
  private List<TeamChatMessage> messages;

  @PrePersist
  protected void onCreate() {
    setCode(society.toLowerCase() + "-" + name.toLowerCase().replace(" ", "-"));
  }
}
