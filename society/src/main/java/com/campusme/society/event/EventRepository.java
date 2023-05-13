package com.campusme.society.event;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface EventRepository extends PagingAndSortingRepository<Event, Long> {
  Optional<Event> findByIdAndPublished(Long id, Boolean published);

  Page<Event> findByPublished(Boolean published, Pageable paging);

  Page<Event> findBySocietyCodeAndPublished(String code, Boolean published, Pageable paging);

  @Query("SELECT e FROM Event e WHERE e.published = true AND NOT EXISTS (SELECT m FROM SocietyMute m WHERE m.userId = ?1 AND m.societyId = e.society.id)")
  Page<Event> findByFollowedSocieties(Long user, Pageable paging);
}
