package com.campusme.society.event;


import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {
  Collection<Event> findBySocietyId(long id);
}
