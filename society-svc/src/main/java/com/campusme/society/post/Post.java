package com.campusme.society.post;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.campusme.society.event.EventAttachment;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

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
@EntityListeners(AuditingEntityListener.class)
public class Post {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(nullable = false)
  private String title;

  @Column(columnDefinition = "TEXT", nullable = false)
  private String text;

  @ManyToOne
  @JoinColumn(name = "event_id", nullable = false)
  private Event event;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  @OneToOne
  @JoinColumn(name = "member_id", nullable = false)
  private Member createdBy;

  @OneToMany(mappedBy = "post")
  @Builder.Default
  private List<PostAttachment> attachments = new ArrayList<>();

  public List<String> getAttachments() {
    return attachments.stream().map(a -> a.getUri()).toList();
  }
}
