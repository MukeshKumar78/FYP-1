package com.campusme.society.society;

import java.util.Set;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.campusme.society.event.Event;

@Entity
public class Society {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(nullable = false)
  private String title;

  @ManyToOne
  @JoinColumn(name = "tenure_id", nullable = false)
  private Tenure tenure;

  @OneToMany(mappedBy = "society")
  private Set<Event> events;

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

  public Tenure getTenure() {
    return tenure;
  }

  public void setTenure(Tenure tenure) {
    this.tenure = tenure;
  }

  public Set<Event> getEvents() {
    return events;
  }

  public void setEvents(Set<Event> events) {
    this.events = events;
  }

}
