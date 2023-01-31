package com.campusme.society.society;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface TenureRepository extends JpaRepository<Tenure, Long> {
  Optional<Tenure> findByCode(String code);
}
