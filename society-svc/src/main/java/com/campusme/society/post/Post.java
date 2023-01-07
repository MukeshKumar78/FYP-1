package com.campusme.society.post;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.campusme.society.event.Event;
import com.campusme.society.member.Member;

/**
 * {@code Post} represents an update to a Society Event
 */
@Entity
public class Post {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(columnDefinition = "TEXT", nullable = false)
  private String text;

  @ManyToOne
  @JoinColumn(name = "event_id", nullable = false)
  private Event event;

  @OneToOne
  @JoinColumn(name = "member_id", nullable = false)
  private Member createdBy;

  public Member getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(Member createdBy) {
    this.createdBy = createdBy;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public Event getEvent() {
    return event;
  }

  public void setEvent(Event event) {
    this.event = event;
  }

}
