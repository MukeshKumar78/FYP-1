package com.campusme.society.society;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import io.swagger.v3.oas.annotations.Operation;
import lombok.Data;

@Data
class AddSocietyRequest {
  String code;
}

/**
 * REST Controller for Societies
 */
@RestController
public class TenureController {

  @Autowired
  private TenureRepository tenureRepository;

  @Autowired
  private BaseSocietyRepository baseSocietyRepository;

  @Autowired
  private SocietyRepository societyRepository;

  @Operation(summary = "get all tenures")
  @GetMapping("/tenures")
  public List<Tenure> findAll() {
    return tenureRepository.findAll();
  }

  @Operation(summary = "get one tenure")
  @GetMapping("/tenures/{code}")
  public Tenure findOne(@PathVariable String code) {
    Tenure value = tenureRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Tenure not found"));

    return value;
  }

  @Operation(summary = "add society to tenure")
  @PreAuthorize("hasRole('ADMIN')")
  @PostMapping("/tenures/{code}")
  public Society addSociety(@PathVariable String code, @RequestBody AddSocietyRequest body) {
    BaseSociety baseSociety = baseSocietyRepository.findByCode(body.getCode()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    Tenure tenure = tenureRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Tenure not found"));

    String societyCode = baseSociety.getCode() + "-" + tenure.getCode();

    if (societyRepository.existsByCode(societyCode)) {
      throw new ResponseStatusException(
          HttpStatus.BAD_REQUEST, "Society already added to tenure");
    }

    Society society = societyRepository.save(
        Society.builder()
            .name(baseSociety.getName())
            .fullName(baseSociety.getFullName())
            .code(societyCode)
            .description(baseSociety.getDescription())
            .image(baseSociety.getImage())
            .tenure(tenure)
            .base(baseSociety)
            .build());

    return society;
  }
}
