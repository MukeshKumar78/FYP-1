package com.campusme.society.event;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {
  List<Event> findBySociety(long id);
}
