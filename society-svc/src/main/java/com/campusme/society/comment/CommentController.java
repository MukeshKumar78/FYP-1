package com.campusme.society.comment;

import java.util.List;

import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class CommentController {
  @Autowired
  private CommentRepository commentRepository;
  @Autowired
  private EventRepository eventRepository;

  /**
   * Endpoint for comments of an event, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Comment}s
   */
  @GetMapping(value = "/events/{id}/comments")
  public List<Comment> findByEventId(@PathVariable Long id) {
    List<Comment> comments = commentRepository.findByEventId(id);
    return comments;
  }

  @PostMapping(path = "/events/{id}/comments")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Comment save(AppUserAuthenticationToken auth, @PathVariable Long id,
                               @RequestBody CommentCreateRequestDTO dto) {
    Comment comment = dto.toComment();

    // Find Event
    Event event = eventRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException( HttpStatus.NOT_FOUND, "Event not found")
    );

    AppUser user = (AppUser) auth.getPrincipal();

    // Prevent duplicate comments from same user
    if(commentRepository.existsByEventIdAndCreatedByCodeAndText(id, user.getCode(), comment.getText())) {
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Duplicate comment");
    }

    comment.setEvent(event);
    comment.setCreatedBy(user);

    // Save and return comment with associated event
    return commentRepository.save(comment);
  }

  /**
   * Endpoint for removing a comment
   * 
   * @param id Long
   * @throws ResponseStatusException: 404 (Comment not found)
   */
  @DeleteMapping("/comments/{id}")
  public void removeMember(AppUserAuthenticationToken auth, @PathVariable Long id) {
    Comment comment = commentRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException( HttpStatus.NOT_FOUND, "Comment not found")
    );

    if(comment.getCreatedBy().getId() != ((AppUser) auth.getPrincipal()).getId())
      throw new ResponseStatusException( HttpStatus.FORBIDDEN);

    commentRepository.deleteById(id);

    return;
  }
}
