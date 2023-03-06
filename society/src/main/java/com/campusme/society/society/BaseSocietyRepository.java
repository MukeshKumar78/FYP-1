package com.campusme.society.society;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BaseSocietyRepository extends JpaRepository<BaseSociety, Long> {
  Optional<BaseSociety> findByCode(String code);
  Boolean existsByCode(String code);
}
