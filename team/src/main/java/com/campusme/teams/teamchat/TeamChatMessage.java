package com.campusme.teams.teamchat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.campusme.teams.member.Member;

@Entity
public class TeamChatMessage {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @ManyToOne
  @JoinColumn(name = "membership_id", nullable = false)
  private Member membership;

  @Column(nullable = false)
  private String content;

  // private MessageType type;

  // public enum MessageType {
  // CHAT, LEAVE, JOIN
  // }
}
