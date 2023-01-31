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
public class BaseSociety {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(columnDefinition = "TEXT")
  private String image;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private String fullName;

  @CreatedDate
  @Column(updatable = false)
  private Date createdAt;

  @LastModifiedDate
  @Column
  private Date updatedAt;

  @OneToMany(mappedBy = "base")
  @Builder.Default
  private List<Society> societies = new ArrayList<>();
}
