package com.campusme.society.event;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.campusme.society.member.Member;
import com.campusme.society.post.Post;
import com.campusme.society.society.Society;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Event {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private String code;

  @Column
  private String description;

  @Column(nullable = false)
  private String title;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  @LastModifiedDate
  @Column
  private Date updatedAt;

  @Column
  private Date publishedAt;

  @Column(nullable = false)
  private Date startDate;

  @Column
  private Date endDate;

  @Column
  @Builder.Default
  private boolean published = false;

  @Column(columnDefinition = "TEXT", nullable = false)
  private String text;

  // Link for event registration
  @Column(columnDefinition = "TEXT")
  private String registrationLink;

  @ManyToOne
  @JoinColumn(name = "society_id", nullable = false)
  private Society society;

  @OneToOne
  @JoinColumn(name = "member_id", nullable = false)
  private Member createdBy;

  @OneToMany(mappedBy = "event")
  private List<Post> post;

  @OneToMany(mappedBy = "event")
  @Builder.Default
  private List<EventAttachment> attachments = new ArrayList<>();

  public List<String> getAttachments() {
    return attachments.stream().map(a -> a.getUri()).toList();
  }

  @PrePersist
  protected void onCreate() {
    setCode(java.util.UUID.randomUUID().toString());
  }
}
