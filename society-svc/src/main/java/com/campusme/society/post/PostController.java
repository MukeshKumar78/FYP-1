package com.campusme.society.post;

import java.io.IOException;
import java.util.List;

import com.campusme.society.View;
import com.campusme.society.FileUploadUtil;
import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import com.fasterxml.jackson.annotation.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class PostController {
  @Autowired
  private PostRepository postRepository;
  @Autowired
  private EventRepository eventRepository;
  @Autowired
  private FileUploadUtil fileUploadUtil;
  @Autowired
  private PostAttachmentRepository postAttachmentRepository;

  /**
   * Endpoint for posts of an event, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Post}s
   */
  @GetMapping(value = "/events/{id}/posts")
  @JsonView(View.Summary.class)
  public List<Post> findByEventId(@PathVariable Long id) {
    List<Post> posts = postRepository.findByEventId(id);
    return posts;
  }

  @PostMapping(path = "/events/{id}/posts", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), @webSecurity.fromEvent(#id), 'post', 'create')")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Post save(AppUserAuthenticationToken auth, @PathVariable Long id,
                               @ModelAttribute PostCreateRequestDTO dto) {
    Post post = dto.toPost(); 

    // Find Event
    Event event = eventRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException( HttpStatus.NOT_FOUND, "Event not found")
    );
    post.setEvent(event);
    post.setCreatedBy(((AppUser) auth.getPrincipal()));

    // Save Post with associated event
    postRepository.save(post);

    // Upload and Set attachments
    if (!dto.getAttachments().isEmpty()) {
      try {
        List<String> files = fileUploadUtil.upload(dto.getAttachments());

        List<PostAttachment> attachments = files.stream().map(file -> {
          PostAttachment attachment = new PostAttachment();
          attachment.setUri(file);
          attachment.setPost(post);
          return postAttachmentRepository.save(attachment);
        }).toList();

        post.setAttachments(attachments);

      } catch (IOException error) {
        System.out.println(error.getMessage());
        throw new ResponseStatusException(
                HttpStatus.INTERNAL_SERVER_ERROR, "Failed to save attachments");
      }
    }

    return post;
  }
}
