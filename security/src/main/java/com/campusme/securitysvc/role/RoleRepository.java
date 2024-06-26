package com.campusme.securitysvc.role;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
  Role findByCode(String code);
}
