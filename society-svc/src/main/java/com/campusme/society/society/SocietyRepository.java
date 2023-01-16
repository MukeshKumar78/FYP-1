package com.campusme.society.society;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SocietyRepository extends JpaRepository<Society, Long> {
  Optional<Society> findByCode(String code);
}
