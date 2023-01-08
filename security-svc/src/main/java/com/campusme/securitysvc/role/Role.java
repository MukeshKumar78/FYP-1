package com.campusme.securitysvc.role;

import java.util.Set;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.campusme.securitysvc.permission.Permission;

/**
 * Role Entity
 * <br>
 * Example:
 * {@code Role(id: 1, code: 'ADMIN', description: 'admin role', permissions: [Permission(...),...])}
 */
@Data
@NoArgsConstructor
@Entity
public class Role {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column
  private String name;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "roles_permissions", joinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id"))
  private Set<Permission> permissions;

  public Role(long id, String code, String description, String name, Set<Permission> permissions) {
    this.id = id;
    this.code = code;
    this.description = description;
    this.name = name;
    this.permissions = permissions;
  }

  public Role(String code) {
    this.code = code;
  }

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

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Set<Permission> getPermissions() {
    return permissions;
  }

  public void setPermissions(Set<Permission> permissions) {
    this.permissions = permissions;
  }
}
