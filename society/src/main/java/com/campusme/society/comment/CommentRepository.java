package com.campusme.society.comment;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CommentRepository extends PagingAndSortingRepository<Comment, Long> {
  Page<Comment> findByEventId(Long id, Pageable pageable);

  @Transactional
  boolean existsByEventIdAndCreatedByCodeAndText(Long id, String code, String text);
}
