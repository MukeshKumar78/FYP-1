package com.campusme.society.society;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

@Transactional
public interface TenureRepository extends CrudRepository<Tenure, Long> {
  // @Override
  // @RestResource(exported = false)
  // void deleteById(Long id);
}
