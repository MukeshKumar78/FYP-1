package com.campusme.society.event;

import java.util.List;
import java.util.Optional;

import javax.persistence.Tuple;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface EventRepository extends PagingAndSortingRepository<Event, Long> {
  Optional<Event> findByIdAndPublished(Long id, Boolean published);

  Page<Event> findByPublished(Boolean published, Pageable paging);

  Page<Event> findBySocietyCodeAndPublished(String code, Boolean published, Pageable paging);
}
