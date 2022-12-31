package com.campusme.society.event;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.campusme.society.post.Post;
import com.campusme.society.society.Society;

@Entity
public class Event {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column
  private String title;

  // start-date and end-date for the event
  @Column
  private Date startDate;
  @Column
  private Date endDate;

  // To distinguish between publish and unpublished event.
  @Column
  private boolean published;

  @Column
  private long ratingSum;

  @Column
  private long ratingCount;

  @Column(columnDefinition = "TEXT", nullable = false)
  private String text;

  // Link for event registration
  @Column(columnDefinition = "TEXT")
  private String registrationLink;

  @ManyToOne
  @JoinColumn(name = "society_id", nullable = false)
  private Society society;

  // // Multiple comments for the event
  // @OneToMany(mappedBy = "event")
  // private Set<Comment> comments;

  // Multiple Posts for the event
  @OneToMany(mappedBy = "event")
  private Set<Post> post;

  public long getId() {
    return id;
  }

  public String getCode() {
    return code;
  }

  public String getDescription() {
    return description;
  }

  public String getTitle() {
    return title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public boolean isPublished() {
    return published;
  }

  public long getRatingSum() {
    return ratingSum;
  }

  public long getRatingCount() {
    return ratingCount;
  }

  public String getText() {
    return text;
  }

  public String getRegistrationLink() {
    return registrationLink;
  }

  public Society getSociety() {
    return society;
  }

  public Set<Post> getPost() {
    return post;
  }

  // // Multiple file attachments for the event.
  // @OneToMany(mappedBy = "event")
  // private Set<EventAttachment> attachment;

}
