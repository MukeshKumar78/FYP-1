package com.campusme.teams.user;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

@Transactional
public interface AppUserRepository extends CrudRepository<AppUser, Long> {
  @RestResource
  AppUser findByEmail(String email);
  // @Override
  // @RestResource(exported = false)
  // void deleteById(Long id);
}
