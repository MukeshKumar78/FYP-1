package com.campusme.society.comment;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {
  List<Comment> findByEventId(Long id);
  boolean existsByEventIdAndCreatedByCodeAndText(Long id, String code, String text);
}
