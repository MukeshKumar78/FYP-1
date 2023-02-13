package com.campusme.society.comment;

import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.campusme.society.event.Event;
import com.campusme.society.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * {@code Comment} represents a comment to a Society Event
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Comment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true)
  private String code;

  @Column(columnDefinition = "TEXT", nullable = false)
  @Size(min=3, max=250)
  private String text;

  @ManyToOne
  @JoinColumn(name = "event_id", nullable = false)
  @JsonIgnore
  private Event event;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  @OneToOne
  @JoinColumn(name = "user_id", nullable = false)
  @JsonIgnoreProperties("memberships")
  private AppUser createdBy;
}
