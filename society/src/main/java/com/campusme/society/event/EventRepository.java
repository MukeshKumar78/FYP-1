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

  @Query(value = """
      (select id, created_at, 'event' as type from event
       union
       select id, created_at, 'post' as type from post)
       order by created_at desc
       limit (:limit);
      """, nativeQuery = true)
  List<Object> findLatestFeedItemIds(@Param("limit") Integer limit);
}
