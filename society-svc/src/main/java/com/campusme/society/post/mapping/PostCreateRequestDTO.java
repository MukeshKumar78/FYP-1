package com.campusme.society.post.mapping;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostCreateRequestDTO {
    String description;
    String title;

    String text;
    List<MultipartFile> attachments = new ArrayList<MultipartFile>();
}
