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

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.campusme.society.post.Post;
import com.campusme.society.society.Society;
import com.campusme.society.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Indexed
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Event {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false)
  private String code;

  @Column
  private String description;

  @FullTextField
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

  @FullTextField
  @Column(columnDefinition = "TEXT", nullable = false)
  private String text;

  // Link for event registration
  @Column(columnDefinition = "TEXT")
  private String registrationLink;

  @ManyToOne
  @JoinColumn(name = "society_id", nullable = false)
  @JsonIgnoreProperties({"tenure", "base"})
  private Society society;

  @OneToOne
  @JoinColumn(name= "user_id", nullable = false)
  @JsonIgnoreProperties("memberships")
  private AppUser createdBy;

  @OneToMany(mappedBy = "event")
  @IndexedEmbedded
  @JsonIgnore
  private List<Post> posts;

  @OneToMany(mappedBy = "event")
  @Builder.Default
  private List<EventAttachment> attachments = new ArrayList<>();

  public List<String> getAttachments() {
    return attachments.stream().map(a -> a.getUri()).toList();
  }

  @PrePersist
  protected void onCreate() {
    setCode(title.toLowerCase().replace(" ", "-") + "-" + RandomStringUtils.random(10, true, true).toLowerCase());
  }
}
