package com.campusme.society.user;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RestResource;

@Transactional
public interface AppUserRepository extends JpaRepository<AppUser, Long> {
  @RestResource
  Optional<AppUser> findByEmail(String email);

  Optional<AppUser> findByCode(String code);

  @Query("SELECT u FROM AppUser u WHERE NOT EXISTS (SELECT m FROM SocietyMute m WHERE m.userId = u.id AND m.societyId = ?1)")
  List<AppUser> findFollowers(Long society);
}
