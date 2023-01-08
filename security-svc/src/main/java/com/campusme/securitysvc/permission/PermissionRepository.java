package com.campusme.securitysvc.permission;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionRepository extends JpaRepository<Permission, Long> {
  Permission findByCode(String code);
}
