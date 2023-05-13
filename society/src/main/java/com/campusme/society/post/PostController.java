package com.campusme.society.post;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import com.campusme.society.FileUploadUtil;
import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;

import io.swagger.v3.oas.annotations.Operation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
   * Endpoint to get all posts paginated and sorted based on query parameters
   *
   * @param pageNo   Integer (default: 0)
   * @param pageSize Integer (default: 10)
   * @param sortBy   Integer (default: createdAt) sorts by descending
   */
  @Operation(summary = "get all posts")
  @GetMapping("/posts")
  public List<Post> findAll(
      AppUserAuthenticationToken auth,
      @RequestParam(defaultValue = "0") Integer pageNo,
      @RequestParam(defaultValue = "10") Integer pageSize,
      @RequestParam(defaultValue = "createdAt") String sortBy,
      @RequestParam(required = false) Long event) {

    Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());

    List<Post> posts;
    if (event == null)
      return postRepository.findByFollowedSocieties(((AppUser) auth.getPrincipal()).getId(), paging).getContent();
    else
      return postRepository.findByEventId(event, paging).getContent();
  }

  /**
   * Endpoint to create a new event
   * 
   * @param eventDTO {@code PostCreateRequestDTO} object as multipart form data
   * @return Created {@code Post}
   */
  @PostMapping(path = "/posts", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), @webSecurity.fromEvent(#dto.getEvent()), 'post', 'create')")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Post save(AppUserAuthenticationToken auth,
      @ModelAttribute @Valid PostCreateRequestDTO dto) {
    Post post = dto.toPost();

    // Find Event
    Event event = eventRepository.findById(dto.getEvent()).orElseThrow(
        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Event not found"));
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

  /**
   * Endpoint for removing a Post
   * 
   * @param id Long
   * @throws ResponseStatusException: 404 (Comment not found)
   */
  @DeleteMapping("/posts/{id}")
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), @webSecurity.fromPost(#id), 'post', 'delete')")
  public void remove(AppUserAuthenticationToken auth, @PathVariable Long id) {
    if (!postRepository.existsById(id))
      throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Post not found");

    postRepository.deleteById(id);
  }
}
