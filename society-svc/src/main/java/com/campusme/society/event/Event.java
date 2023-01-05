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
import javax.persistence.OneToOne;

import com.campusme.society.member.Member;
import com.campusme.society.post.Post;
import com.campusme.society.society.Society;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
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

  @Column
  private Date startDate;

  @Column
  private Date endDate;

  @Column
  private boolean published;

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
  private Set<Post> post;

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

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public boolean isPublished() {
    return published;
  }

  public void setPublished(boolean published) {
    this.published = published;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public String getRegistrationLink() {
    return registrationLink;
  }

  public void setRegistrationLink(String registrationLink) {
    this.registrationLink = registrationLink;
  }

  public Society getSociety() {
    return society;
  }

  public void setSociety(Society society) {
    this.society = society;
  }

  public Member getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(Member createdBy) {
    this.createdBy = createdBy;
  }

  public Set<Post> getPost() {
    return post;
  }

  public void setPost(Set<Post> post) {
    this.post = post;
  }
}
