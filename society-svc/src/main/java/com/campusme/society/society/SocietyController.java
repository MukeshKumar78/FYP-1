package com.campusme.society.society;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.config.persistence.FileUploadUtil;
import com.campusme.society.society.mapping.SocietyCreateRequestDTO;
import com.campusme.society.society.mapping.SocietyMapper;
import com.campusme.society.society.mapping.SocietyResponseDTO;

import io.swagger.v3.oas.annotations.Operation;

/**
 * REST Controller for Societies
 */
@RestController
public class SocietyController {

  @Autowired
  private SocietyRepository societyRepository;

  @Autowired
  private BaseSocietyRepository baseSocietyRepository;
  
  @Autowired
  private TenureRepository tenureRepository;

  @Autowired
  private FileUploadUtil fileUploadUtil;

  @Autowired
  private SocietyMapper mapper;

  @Operation(summary = "get all societies")
  @GetMapping("/societies")
  public List<SocietyResponseDTO> findAll() {
    return mapper.societyListToDTO(
        societyRepository.findAll());
  }

  @Operation(summary = "get one society", description="finds an active society in a tenure given code for the base society")
  @GetMapping("/societies/{code}/current")
  public SocietyResponseDTO findOne(@PathVariable String code) {
    Society value = societyRepository.findCurrentByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return mapper.societyToDTO(value);
  }

  /**
   * Endpoint to create a new society<br/>
   * only accessible to admins
   *
   * @param id         Tenure ID
   * @param societyDTO {@code SocietyCreateRequestDTO} object as multipart form data
   * @return Created {@code Society}
   */
  // @PreAuthorize("hasRole(ADMIN)")
  @Operation(summary = "create society")
  @PostMapping(path = "/societies", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @ResponseStatus(code = HttpStatus.CREATED)
  public SocietyResponseDTO save(@ModelAttribute SocietyCreateRequestDTO societyDTO) {
    if(baseSocietyRepository.existsByCode(societyDTO.getCode())) {
      throw new ResponseStatusException(
          HttpStatus.BAD_REQUEST, "Society with code already exists");
    }
    BaseSociety society = mapper.DTOtoSociety(societyDTO);

    // Save Image
    try {
      String file = fileUploadUtil.upload(societyDTO.getImage());
      society.setImage(file);
    } catch (IOException error) {
      System.out.println(error.getMessage());
      throw new ResponseStatusException(
          HttpStatus.INTERNAL_SERVER_ERROR, "Failed to save image");
    }

    // Save Society
    baseSocietyRepository.save(society);

    return mapper.societyToDTO(society);
  }
}
