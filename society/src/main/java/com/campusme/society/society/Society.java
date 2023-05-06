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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.campusme.society.View;
import com.campusme.society.event.Event;
import com.campusme.society.member.Member;
import com.campusme.society.user.AppUser;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;

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
public class Society {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false, unique = true)
  @JsonView(View.Summary.class)
  private String code;

  @Column
  private String description;

  @Column(columnDefinition = "TEXT")
  @JsonView(View.Summary.class)
  private String image;

  @Column(nullable = false)
  @JsonView(View.Summary.class)
  private String name;

  @Column(nullable = false)
  @JsonView(View.Summary.class)
  private String fullName;

  @CreatedDate
  @Column(updatable = false)
  @JsonView(View.Summary.class)
  private Date createdAt;

  @LastModifiedDate
  @Column
  private Date updatedAt;

  @ManyToOne
  @JoinColumn(name = "tenure_id", nullable = false)
  @JsonIgnoreProperties("societies")
  private Tenure tenure;

  @ManyToOne
  @JoinColumn(nullable = false)
  @JsonIgnoreProperties("societies")
  private BaseSociety base;

  @OneToMany(mappedBy = "society")
  @Builder.Default
  @JsonIgnore
  private List<Event> events = new ArrayList<Event>();

  @OneToMany(mappedBy = "society")
  @Builder.Default
  @JsonIgnore
  private List<Member> members = new ArrayList<Member>();

  @OneToMany(mappedBy = "society")
  @Builder.Default
  @JsonIgnore
  private List<SocietyMute> mutes = new ArrayList<SocietyMute>();

  @Builder.Default
  private Boolean muted = false;

  public Boolean getMuted() {
    try {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      AppUser user = (AppUser) auth.getPrincipal();
      return mutes.stream()
          .anyMatch(mute -> mute.getUser().getId().equals(user.getId()));
    } catch (Exception e) {
      return muted || false;
    }
  }
}
