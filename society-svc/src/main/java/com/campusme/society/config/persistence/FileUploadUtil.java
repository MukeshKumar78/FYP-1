package com.campusme.society.config.persistence;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadUtil {

  @Value("${static.location}")
  private String filePath;

  public List<String> upload(List<MultipartFile> files) throws IOException {
    List<String> fileNames = new ArrayList<>();

    for(MultipartFile file : files) {
      fileNames.add(upload(file));
    }

    return fileNames;
  }

  public String upload(MultipartFile file) throws IOException {
    File uploadedFile = new File(filePath + file.getOriginalFilename());
    file.transferTo(uploadedFile);
    return uploadedFile.getName();
  }
}
