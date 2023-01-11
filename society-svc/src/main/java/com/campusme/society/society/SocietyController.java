package com.campusme.society.society;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.society.mapping.SocietyMapper;
import com.campusme.society.society.mapping.SocietyResponseDTO;

/**
 * REST Controller for Societies
 */
@RestController
public class SocietyController {

  @Autowired
  private SocietyRepository societyRepository;

  @Autowired
  private SocietyMapper mapper;


  @GetMapping("/societies/{id}")
  public SocietyResponseDTO findOne(@PathVariable long id) {
    Society value = societyRepository.findById(id).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return mapper.societyToDTO(value);
  }
}
