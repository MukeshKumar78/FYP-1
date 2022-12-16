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

import com.campusme.society.society.Society;

@Entity
public class Event {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
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

  // // Multiple Posts for the event
  // @OneToMany(mappedBy = "event")
  // private Set<Post> post;

  // // Multiple file attachments for the event.
  // @OneToMany(mappedBy = "event")
  // private Set<EventAttachment> attachment;


  public long getId() {
    return id;
  }

  public void setId(final long id) {
    this.id = id;
  }

  public String getCode() {
    return code;
  }

  public void setCode(final String code) {
    this.code = code;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(final String description) {
    this.description = description;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(final String title) {
    this.title = title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(final Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(final Date endDate) {
    this.endDate = endDate;
  }

  public boolean isPublished() {
    return published;
  }

  public void setPublished(final boolean published) {
    this.published = published;
  }

  public long getRatingSum() {
    return ratingSum;
  }

  public void setRatingSum(final long ratingSum) {
    this.ratingSum = ratingSum;
  }

  public long getRatingCount() {
    return ratingCount;
  }

  public void setRatingCount(final long ratingCount) {
    this.ratingCount = ratingCount;
  }

  public String getText() {
    return text;
  }

  public void setText(final String text) {
    this.text = text;
  }

  public String getRegistrationLink() {
    return registrationLink;
  }

  public void setRegistrationLink(final String registrationLink) {
    this.registrationLink = registrationLink;
  }

  public Society getSociety() {
    return society;
  }

  public void setSociety(final Society society) {
    this.society = society;
  }

}
