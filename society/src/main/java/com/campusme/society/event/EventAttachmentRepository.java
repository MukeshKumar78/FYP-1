package com.campusme.society.event;

import org.springframework.data.repository.CrudRepository;

public interface EventAttachmentRepository extends CrudRepository<EventAttachment, Long> { 
  public boolean existsByEventIdAndUri(Long eventId, String uri);
}
