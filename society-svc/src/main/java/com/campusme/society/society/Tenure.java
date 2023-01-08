package com.campusme.society.society;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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

  @OneToMany(mappedBy = "tenure")
  @Builder.Default
  private Set<Society> societies = new HashSet<>();
}
