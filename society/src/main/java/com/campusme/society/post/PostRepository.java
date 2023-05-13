package com.campusme.society.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface PostRepository extends PagingAndSortingRepository<Post, Long> {
  Page<Post> findByEventId(Long eventId, Pageable sort);

  @Query("SELECT p FROM Post p WHERE NOT EXISTS (SELECT m FROM SocietyMute m WHERE m.userId = ?1 AND m.societyId = p.event.society.id)")
  Page<Post> findByFollowedSocieties(Long user, Pageable paging);
}
