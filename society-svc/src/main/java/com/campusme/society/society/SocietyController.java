package com.campusme.society.society;

import java.util.List;

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

  @GetMapping("/societies")
  public List<SocietyResponseDTO> findAll() {
    return mapper.societyListToDTO(
      societyRepository.findAll()
    );
  }

  @GetMapping("/societies/{code}")
  public SocietyResponseDTO findOne(@PathVariable String code) {
    Society value = societyRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return mapper.societyToDTO(value);
  }
}
