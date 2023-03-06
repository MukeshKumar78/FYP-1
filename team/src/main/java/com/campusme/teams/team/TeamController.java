package com.campusme.teams.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.teams.user.AppUserAuthenticationToken;

import io.swagger.v3.oas.annotations.Operation;
import lombok.Data;

/**
 * REST Controller for Societies
 */
@RestController
public class TeamController {

  @Autowired
  private TeamRepository teamRepository;


  @Operation(summary = "get all teams")
  @GetMapping("/teams")
  public List<Team> findAll() {
    return teamRepository.findAll();
  }

  @Operation(summary = "get team")
  @GetMapping("/teams/{code}")
  public Team findOne(@PathVariable String code) {
    Team team = teamRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Team not found"));

    return team;
  }

  @Operation(summary = "get all society teams")
  @GetMapping("/societies/{code}/teams")
  public List<Team> findBySociety(@PathVariable String code) {
    List<Team> societies = teamRepository.findBySociety(code);
    return societies;
  }

  /**
   * Endpoint to create a new team
   * <br/>
   *
   * @param teamDTO {@code TeamCreateRequestDTO} object in request body 
   * @return Created {@code Team}
   */
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), #dto.getSociety(), 'TEAM', 'CREATE')")
  @Operation(summary = "create team")
  @PostMapping(path = "/teams")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Team save(AppUserAuthenticationToken auth, @RequestBody TeamCreateRequestDTO dto) {
    Team team = dto.toTeam();

    // Save and return Team (already validated during PreAuthorize)
    return teamRepository.save(team);
  }
}

@Data
class TeamCreateRequestDTO {
  private String name;
  private String society;

  public Team toTeam() {
    return Team.builder()
    .name(name)
    .society(society)
    .build();
  }
}
