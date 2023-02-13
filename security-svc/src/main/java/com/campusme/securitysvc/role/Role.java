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
import lombok.AllArgsConstructor;
import lombok.Builder;

import com.campusme.securitysvc.permission.Permission;

/**
 * Role Entity
 * <br>
 * Example:
 * {@code Role(id: 1, code: 'ADMIN', description: 'admin role', permissions: [Permission(...),...])}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Role {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true)
  private String code;

  @Column
  private String description;

  @Column(nullable=false)
  private String name;

  @Column(nullable=false, unique=true)
  private Integer precedence;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "roles_permissions", joinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id"))
  private Set<Permission> permissions;
}
