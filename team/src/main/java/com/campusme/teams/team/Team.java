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
  @GeneratedValue(strategy = GenerationType.AUTO)
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

  @PrePersist
  protected void onCreate() {
    setCode(society.toLowerCase() + "-" + name.toLowerCase().replace(" ", "-"));
  }
}
