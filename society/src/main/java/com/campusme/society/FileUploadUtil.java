package com.campusme.society;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


/**
 * Utility class for uploading files to ${static.location}
 */
@Service
public class FileUploadUtil {

  @Value("${static.location}")
  private String filePath;


  /**
   * Saves files to directory appends a random string at the end of the filename 
   */
  public List<String> upload(List<MultipartFile> files) throws IOException {
    List<String> fileNames = new ArrayList<>();

    for(MultipartFile file : files) {
      fileNames.add(upload(file));
    }

    return fileNames;
  }

  /**
   * Saves a file to directory appends a random string at the end of the filename 
   */
  public String upload(MultipartFile file) throws IOException {
    File uploadedFile = new File(filePath + RandomStringUtils.random(10, true, true).toLowerCase() + file.getOriginalFilename());
    file.transferTo(uploadedFile);
    return uploadedFile.getName();
  }
}
