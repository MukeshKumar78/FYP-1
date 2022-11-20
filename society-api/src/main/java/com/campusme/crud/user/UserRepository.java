package com.campusme.crud.user;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:3000")
@Transactional
@RepositoryRestResource
public interface UserRepository extends CrudRepository<User, Long> {
  // @Override
  // @RestResource(exported = false)
  // void deleteById(Long id);
}
