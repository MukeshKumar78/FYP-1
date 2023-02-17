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

import com.campusme.society.FileUploadUtil;
import com.campusme.society.user.AppUserAuthenticationToken;

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
  private FileUploadUtil fileUploadUtil;


  @Operation(summary = "get all societies")
  @GetMapping("/societies")
  public List<BaseSociety> findAll() {
    return baseSocietyRepository.findAll();
  }

  @Operation(summary = "get current society", description="finds an active society in a tenure given code for the base society")
  @GetMapping("/societies/base/{code}/current")
  public Society findCurrent(@PathVariable String code) {
    Society society = societyRepository.findCurrentByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return society;
  }

  @Operation(summary = "get one base society")
  @GetMapping("/societies/base/{code}")
  public BaseSociety findOneBase(@PathVariable String code) {
    BaseSociety society = baseSocietyRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return society;
  }

  @Operation(summary = "get all society tenures")
  @GetMapping("/societies/base/{code}/all")
  public List<Society> findByBase(@PathVariable String code) {
    List<Society> societies = societyRepository.findByBaseCode(code);
    return societies;
  }


  @Operation(summary = "get one society")
  @GetMapping("/societies/{code}")
  public Society findOne(@PathVariable String code) {
    Society society = societyRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return society;
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
  // @PreAuthorize("hasRole('ADMIN')")
  @ResponseStatus(code = HttpStatus.CREATED)
  public BaseSociety save(AppUserAuthenticationToken auth, @ModelAttribute SocietyCreateRequestDTO dto) {
    if(baseSocietyRepository.existsByCode(dto.getCode())) {
      throw new ResponseStatusException(
          HttpStatus.BAD_REQUEST, "Society with code already exists");
    }
    BaseSociety society = dto.toBaseSociety();

    // Save Image
    try {
      String file = fileUploadUtil.upload(dto.getImage());
      society.setImage(file);
    } catch (IOException error) {
      System.out.println(error.getMessage());
      throw new ResponseStatusException(
          HttpStatus.INTERNAL_SERVER_ERROR, "Failed to save image");
    }

    // Save and return Society
    return baseSocietyRepository.save(society);
  }
}
