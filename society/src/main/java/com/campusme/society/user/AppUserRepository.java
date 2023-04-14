package com.campusme.society.user;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

@Transactional
public interface AppUserRepository extends JpaRepository<AppUser, Long> {
  @RestResource
  Optional<AppUser> findByEmail(String email);

  Optional<AppUser> findByCode(String code);
}
