package com.campusme.society.society;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.campusme.society.user.AppUser;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@IdClass(SocietyMuteId.class)
public class SocietyMute {
  @Id
  @Column(name = "society_id")
  private Long societyId;

  @Id
  @Column(name = "user_id")
  private Long userId;

  @ManyToOne
  @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
  private AppUser user;

  @ManyToOne
  @JoinColumn(name = "society_id", nullable = false, insertable = false, updatable = false)
  private Society society;

  SocietyMute(SocietyMuteId id) {
    this.societyId = id.getSocietyId();
    this.userId = id.getUserId();
  }
}
