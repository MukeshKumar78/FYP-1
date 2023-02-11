package com.campusme.society.comment;

import java.util.List;

import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.member.Member;
import com.campusme.society.member.MemberRepository;
import com.campusme.society.comment.mapping.CommentCreateRequestDTO;
import com.campusme.society.comment.mapping.CommentMapper;
import com.campusme.society.comment.mapping.CommentResponseDTO;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class CommentController {

  @Autowired
  private CommentRepository commentRepository;

  @Autowired
  private CommentMapper commentMapper;

  @Autowired
  private EventRepository eventRepository;

  @Autowired
  private MemberRepository memberRepository;
  /**
   * Endpoint for comments of an event, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Comment}s
   */
  @GetMapping(value = "/events/{id}/comments")
  public List<CommentResponseDTO> findByEventId(@PathVariable Long id) {
    List<Comment> comments = commentRepository.findByEventId(id);
    return commentMapper.entityListToDTOWithoutEvent(comments);
  }

  @PostMapping(path = "/events/{id}/comments")
  @ResponseStatus(code = HttpStatus.CREATED)
  public CommentResponseDTO save(AppUserAuthenticationToken auth, @PathVariable Long id,
                               @RequestBody CommentCreateRequestDTO commentDTO) {
    Comment comment = commentMapper.dtoToEntity(commentDTO);

    // Set Event
    Event event = eventRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException( HttpStatus.NOT_FOUND, "Event not found")
    );
    if (event == null) {
      throw new ResponseStatusException(
              HttpStatus.NOT_FOUND, "Event not found");
    }
    comment.setEvent(event);

    // Set Member
    Member member = memberRepository.findByUserIdAndSocietyId(
            ((AppUser) auth.getPrincipal()).getId(),
            id);
    if (member == null) {
      throw new ResponseStatusException(
              HttpStatus.UNAUTHORIZED);
    }
    comment.setCreatedBy(member);

    // Save event
    commentRepository.save(comment);

    return commentMapper.entityToDTO(comment);
  }
}
