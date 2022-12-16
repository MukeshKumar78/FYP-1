package com.campusme.society.user;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

@Transactional
public interface SocietyUserRepository extends CrudRepository<SocietyUser, Long> {
  @RestResource
  SocietyUser findByEmail(String email);
  // @Override
  // @RestResource(exported = false)
  // void deleteById(Long id);
}
