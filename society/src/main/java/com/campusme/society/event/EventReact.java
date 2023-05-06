package com.campusme.society.event;

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
@IdClass(EventReactId.class)
public class EventReact {
  @Id
  @Column(name = "event_id")
  private Long eventId;

  @Id
  @Column(name = "user_id")
  private Long userId;

  @ManyToOne
  @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
  private AppUser user;

  @ManyToOne
  @JoinColumn(name = "event_id", nullable = false, insertable = false, updatable = false)
  private Event event;

  EventReact(EventReactId eventReactId) {
    this.eventId = eventReactId.getEventId();
    this.userId = eventReactId.getUserId();
  }
}
