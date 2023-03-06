package com.campusme.securitysvc.membership;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Embeddable
class MembershipId implements Serializable {
    String organization;
    String user;
}

/**
 * Membership Entity
 */
@Entity
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = { "organization", "user", "role" }) })
public class Membership {
  @EmbeddedId
  private MembershipId id;

  @Column
  private String role;
}
