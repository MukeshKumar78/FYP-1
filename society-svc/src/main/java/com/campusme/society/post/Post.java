package com.campusme.society.post;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.campusme.society.View;
import com.campusme.society.event.Event;
import com.campusme.society.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * {@code Post} represents an update to a Society Event
 */
@Indexed
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Post {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @JsonView(View.Summary.class)
  private Long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(nullable = false)
  @JsonView(View.Summary.class)
  private String title;

  @FullTextField
  @Column(columnDefinition = "TEXT", nullable = false)
  @JsonView(View.Summary.class)
  private String text;

  @ManyToOne
  @JoinColumn(name = "event_id", nullable = false)
  private Event event;

  @CreatedDate
  @Column(updatable = false)
  @JsonView(View.Summary.class)
  private Date createdAt;

  @OneToOne
  @JoinColumn(name = "user_id", nullable = false)
  @JsonIgnoreProperties("memberships")
  private AppUser createdBy;

  @OneToMany(mappedBy = "post")
  @Builder.Default
  @JsonView(View.Summary.class)
  private List<PostAttachment> attachments = new ArrayList<>();

  public List<String> getAttachments() {
    return attachments.stream().map(a -> a.getUri()).toList();
  }
}
