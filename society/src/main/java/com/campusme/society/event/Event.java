package com.campusme.society.event;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.bridge.mapping.annotation.RoutingBinderRef;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.campusme.society.comment.Comment;
import com.campusme.society.post.Post;
import com.campusme.society.society.Society;
import com.campusme.society.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Indexed(routingBinder = @RoutingBinderRef(type = EventPublishedRoutingBinder.class))
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Event {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Audited
  private Long id;

  @Column(nullable = false)
  @Audited
  private String code;

  @Column
  @Audited
  private String description;

  @FullTextField
  @Column(nullable = false)
  @Audited
  private String title;

  @CreatedDate
  @Column(updatable = false)
  @Audited
  private Date createdAt;

  @LastModifiedDate
  @Column
  @Audited
  private Date updatedAt;

  @Column
  @Audited
  private Date publishedAt;

  @Column(nullable = false)
  @Audited
  private Date startDate;

  @Column
  @Audited
  private Date endDate;

  @Column
  @Builder.Default
  @Audited
  private boolean published = false;

  @FullTextField
  @Column(columnDefinition = "TEXT", nullable = false)
  @Audited
  private String text;

  // Link for event registration
  @Column(columnDefinition = "TEXT")
  @Audited
  private String registrationLink;

  @ManyToOne
  @JoinColumn(name = "society_id", nullable = false)
  @JsonIgnoreProperties({ "tenure", "base" })
  private Society society;

  @OneToOne
  @JoinColumn(name = "user_id", nullable = false)
  @JsonIgnoreProperties("memberships")
  private AppUser createdBy;

  @OneToMany(mappedBy = "event")
  @IndexedEmbedded
  @JsonIgnore
  private List<Post> posts;

  @OneToMany(mappedBy = "event")
  @Builder.Default
  @Audited
  private List<EventAttachment> attachments = new ArrayList<>();

  @OneToMany(mappedBy = "event")
  @Builder.Default
  private List<EventReact> reacts = new ArrayList<>();

  @OneToMany(mappedBy = "event")
  @Builder.Default
  private List<Comment> comments = new ArrayList<>();

  @Builder.Default
  private Boolean reacted = false;

  public List<String> getAttachments() {
    return attachments.stream().map(a -> a.getUri()).toList();
  }

  public Integer getReacts() {
    return reacts.size();
  }

  public Integer getComments() {
    return comments.size();
  }

  public Boolean getReacted() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth == null) {
      return false;
    }
    AppUser user = (AppUser) auth.getPrincipal();
    if (user == null) {
      return false;
    }

    return reacts.stream()
        .anyMatch(a -> a.getUser().getId().equals(user.getId()));
  }

  @PrePersist
  protected void onCreate() {
    setCode(title.toLowerCase().replace(" ", "-") + "-" + RandomStringUtils.random(10, true, true).toLowerCase());
  }
}
