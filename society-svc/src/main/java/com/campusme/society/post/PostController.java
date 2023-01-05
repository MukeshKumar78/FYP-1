package com.campusme.society.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PostController {

  @Autowired
  private PostRepository postRepository;

  /**
   * Endpoint for posts of an event, publicly accessible
   * 
   * @param id
   * @return {@code Collection} of {@code Post}s
   */
  @GetMapping(value = "/events/{id}/posts")
  public ResponseEntity<List<Post>> findByEventId(long id) {
    return ResponseEntity.ok(postRepository.findByEventId(id));
  }
}
