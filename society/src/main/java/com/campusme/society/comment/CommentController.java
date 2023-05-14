package com.campusme.society.comment;

import java.util.List;

import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
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
  @GetMapping(value = "/comments")
  public List<Comment> find(
      @RequestParam Long event,
      @RequestParam(defaultValue = "0") Integer pageNo,
      @RequestParam(defaultValue = "10") Integer pageSize,
      @RequestParam(defaultValue = "createdAt") String sortBy) {
    Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());
    List<Comment> comments = commentRepository.findByEventId(event, paging).getContent();
    return comments;
  }

  @PostMapping(path = "/comments")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Comment save(AppUserAuthenticationToken auth,
      @RequestBody CommentCreateRequestDTO dto) {
    Comment comment = dto.toComment();

    // Find Event
    Event event = eventRepository.findById(dto.getEvent()).orElseThrow(
        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Event not found"));

    AppUser user = (AppUser) auth.getPrincipal();

    // Prevent duplicate comments from same user
    if (commentRepository.existsByEventIdAndCreatedByCodeAndText(dto.getEvent(), user.getCode(), comment.getText())) {
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
  public void remove(AppUserAuthenticationToken auth, @PathVariable Long id) {
    Comment comment = commentRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Comment not found"));

    if (comment.getCreatedBy().getId() != ((AppUser) auth.getPrincipal()).getId())
      throw new ResponseStatusException(HttpStatus.FORBIDDEN);

    commentRepository.deleteById(id);
  }
}
