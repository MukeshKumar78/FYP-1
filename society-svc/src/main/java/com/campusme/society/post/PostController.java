package com.campusme.society.post;

import java.io.IOException;
import java.util.List;

import com.campusme.society.config.persistence.FileUploadUtil;
import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.member.Member;
import com.campusme.society.member.MemberRepository;
import com.campusme.society.post.mapping.PostCreateRequestDTO;
import com.campusme.society.post.mapping.PostMapper;
import com.campusme.society.post.mapping.PostResponseDTO;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class PostController {

  @Autowired
  private PostRepository postRepository;

  @Autowired
  private PostMapper postMapper;

  @Autowired
  private EventRepository eventRepository;

  @Autowired
  private MemberRepository memberRepository;

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
  public List<PostResponseDTO> findByEventId(@PathVariable Long id) {
    List<Post> posts = postRepository.findByEventId(id);
    return postMapper.entityListToDTO(posts);
  }

  @PostMapping(path = "/events/{id}/posts", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @ResponseStatus(code = HttpStatus.CREATED)
  public PostResponseDTO save(AppUserAuthenticationToken auth, @PathVariable Long id,
                               @ModelAttribute PostCreateRequestDTO postDTO) {
//    System.out.println(postDTO.getText());
    Post post = postMapper.dtoToEntity(postDTO);
    System.out.println("text = " + post.getText());

    // Set Event
    Event event = eventRepository.getReferenceById(id);
    if (event == null) {
      throw new ResponseStatusException(
              HttpStatus.NOT_FOUND, "Event not found");
    }
    post.setEvent(event);

    // Set Member
    Member member = memberRepository.findByUserIdAndSocietyId(
            ((AppUser) auth.getPrincipal()).getId(),
            id);
    if (member == null) {
      throw new ResponseStatusException(
              HttpStatus.UNAUTHORIZED);
    }
    post.setCreatedBy(member);

    // Save event
    postRepository.save(post);

    // Upload and Set attachments
    if (!postDTO.getAttachments().isEmpty()) {
      try {
        List<String> files = fileUploadUtil.upload(postDTO.getAttachments());

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

    return postMapper.entityToDTO(post);
  }
}
