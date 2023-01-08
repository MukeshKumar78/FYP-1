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

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * {@code Post} represents an update to a Society Event
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
}
