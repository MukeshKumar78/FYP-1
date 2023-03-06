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
  @JoinColumn(name="user_id", nullable=false)
  private Member sender;

  @Column(nullable=false)
  private String content;

  // private MessageType type;

  // public enum MessageType {
  //   CHAT, LEAVE, JOIN
  // }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Member getSender() {
    return sender;
  }

  public void setSender(Member sender) {
    this.sender = sender;
  }

  // public MessageType getType() {
  //   return type;
  // }

  // public void setType(MessageType type) {
  //   this.type = type;
  // }
}
