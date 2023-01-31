package com.campusme.society.society;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SocietyRepository extends JpaRepository<Society, Long> {
  List<Society> findByCode(String code);
  Boolean existsByCode(String code);

  @Query("SELECT DISTINCT s FROM Society s JOIN s.tenure t JOIN s.base b WHERE t.archived = false AND b.code = ?1")
  Optional<Society> findCurrentByCode(String code);
}
