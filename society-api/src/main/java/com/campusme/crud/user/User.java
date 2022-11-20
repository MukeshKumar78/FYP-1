package com.campusme.crud.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  private String name;

  @Column(unique = true)
  private String email;

  public long getId() {
    return this.id;
  }

  public String getName() {
    return this.name;
  }

  public String setName(String name) {
    return this.name = name;
  }

  public String getEmail() {
    return this.email;
  }

  public String setEmail(String email) {
    return this.email = email;
  }

}

