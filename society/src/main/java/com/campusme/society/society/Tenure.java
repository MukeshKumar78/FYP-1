package com.campusme.society.society;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Represents a date range in which Societies operate
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Entity
public class Tenure {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column
  private String duration;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  @LastModifiedDate
  @Column
  private Date updatedAt;

  @Column
  @Builder.Default
  private Boolean archived = false;

  @OneToMany(mappedBy = "tenure")
  @Builder.Default @JsonIgnoreProperties({"tenure", "base", "events", "memberships"})
  private List<Society> societies = new ArrayList<>();
}
