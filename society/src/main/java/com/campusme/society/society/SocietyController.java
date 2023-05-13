package com.campusme.society.society;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import com.campusme.society.user.AppUser;

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
  private SocietyMuteRepository societyMuteRepository;

  @Autowired
  private BaseSocietyRepository baseSocietyRepository;

  @Autowired
  private FileUploadUtil fileUploadUtil;

  @Operation(summary = "get all societies")
  @GetMapping("/base")
  public List<BaseSociety> findBase() {
    return baseSocietyRepository.findAll();
  }

  @Operation(summary = "get base society")
  @GetMapping("/base/{code}")
  public BaseSociety findOneBase(@PathVariable String code) {
    BaseSociety society = baseSocietyRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return society;
  }

  @Operation(summary = "get current society", description = "finds an active society in a tenure given code for the base society")
  @GetMapping("/base/{code}/current")
  public Society findCurrent(@PathVariable String code) {
    Society society = societyRepository.findCurrentByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    return society;
  }

  /**
   * Endpoint to create a new society<br/>
   * only accessible to admins
   *
   * @param id         Tenure ID
   * @param societyDTO {@code SocietyCreateRequestDTO} object as multipart form
   *                   data
   * @return Created {@code Society}
   */
  // @PreAuthorize("hasRole('ADMIN')")
  @Operation(summary = "create society")
  @PreAuthorize("hasRole('ADMIN')")
  @PostMapping(path = "/base", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @ResponseStatus(code = HttpStatus.CREATED)
  public BaseSociety save(AppUserAuthenticationToken auth, @ModelAttribute SocietyCreateRequestDTO dto) {
    if (baseSocietyRepository.existsByCode(dto.getCode())) {
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

  @Operation(summary = "get societies")
  @GetMapping("/societies")
  public List<Society> find() {
    return societyRepository.findAll();
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
   * Endpoint to mute or unmute a society<br/>
   *
   * @param id Society ID
   */
  @Operation(summary = "mute a society")
  @PostMapping(path = "/societies/{code}/mute")
  public Boolean mute(AppUserAuthenticationToken auth, @PathVariable String code) {
    Society society = societyRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    SocietyMuteId societyMuteId = new SocietyMuteId(
        society.getId(),
        ((AppUser) auth.getPrincipal()).getId());

    if (societyMuteRepository.existsById(societyMuteId)) {
      societyMuteRepository.deleteById(societyMuteId);
      society.setMuted(false);
      return false;
    } else {
      societyMuteRepository.save(new SocietyMute(societyMuteId));
      society.setMuted(true);
      return true;
    }
  }

}
