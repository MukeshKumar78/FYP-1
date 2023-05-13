package com.campusme.teams.teamchat;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.campusme.teams.member.Member;
import com.campusme.teams.team.Team;
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
@EntityListeners(AuditingEntityListener.class)
public class TeamChatMessage {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(cascade = CascadeType.REMOVE)
  @JoinColumn(name = "team_id", nullable = false)
  @JsonIgnoreProperties({ "messages", "memberships" })
  private Team team;

  @CreatedBy
  @ManyToOne
  @JoinColumn(name = "user_id", nullable = false)
  @JsonIgnoreProperties({ "messages", "memberships" })
  private AppUser sender;

  @Column(nullable = false)
  private String content;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  // private MessageType type;

  // public enum MessageType {
  // CHAT, LEAVE, JOIN
  // }
}
