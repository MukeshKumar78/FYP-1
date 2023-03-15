package com.campusme.society.event;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface EventRepository extends PagingAndSortingRepository<Event, Long> {
  Optional<Event> findByIdAndPublished(Long id, Boolean published);

  Page<Event> findByPublished(Boolean published, Pageable paging);

  Page<Event> findBySocietyCodeAndPublished(String code, Boolean published, Pageable paging);
}
