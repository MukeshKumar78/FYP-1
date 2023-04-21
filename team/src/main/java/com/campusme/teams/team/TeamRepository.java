package com.campusme.teams.team;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamRepository extends JpaRepository<Team, Long> {
  Optional<Team> findByCode(String code);

  List<Team> findBySociety(String code);

  Boolean existsByCode(String code);

  Boolean existsByNameAndSociety(String name, String society);
}
