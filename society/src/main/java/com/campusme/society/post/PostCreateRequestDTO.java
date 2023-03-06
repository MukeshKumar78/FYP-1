package com.campusme.society.post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostCreateRequestDTO {
  @NotNull(message = "event is required")
  Long event;

  @NotBlank(message = "title is required")
  @Size(min = 5, max = 25, message = "title size must be between 5 and 25")
  String title;

  @NotBlank(message = "text is required")
  @Size(min = 5, max = 1000, message = "text size must be between 5 and 1000")
  String text;

  List<MultipartFile> attachments = new ArrayList<MultipartFile>();

  Post toPost() {
    return Post.builder()
      .title(title)
      .text(text)
      .build();
  }
}
