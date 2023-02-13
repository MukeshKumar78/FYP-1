package com.campusme.society.comment;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentCreateRequestDTO {
  @NotBlank(message = "title is required")
  @Size(min = 2, max = 50, message = "comment size must be between 5 and 50")
  String text;

  Comment toComment() {
    return Comment.builder()
      .text(text).build();
  }
}

