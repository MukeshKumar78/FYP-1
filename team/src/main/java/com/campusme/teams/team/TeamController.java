package com.campusme.teams.team;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.teams.user.AppUserAuthenticationToken;

import io.swagger.v3.oas.annotations.Operation;
import lombok.Data;

/**
 * REST Controller for Teams
 */
@RestController
public class TeamController {

  @Autowired
  private TeamRepository teamRepository;

  @Operation(summary = "get team")
  @GetMapping("/team/{code}")
  public Team findOne(@PathVariable String code) {
    Team team = teamRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Team not found"));

    return team;
  }

  @Operation(summary = "get all society teams")
  @GetMapping("/team")
  public List<Team> findBySociety(@RequestParam String society) {
    List<Team> teams = teamRepository.findBySociety(society);
    return teams;
  }

  /**
   * Endpoint to create a new team
   * <br/>
   *
   * @param teamDTO {@code TeamCreateRequestDTO} object in request body
   * @return Created {@code Team}
   */
  @PreAuthorize("@webSecurity.hasPrivilege(#auth.getPrincipal(), #dto.getSociety(), 'TEAM', 'CREATE')")
  @Operation(summary = "create team")
  @PostMapping(path = "/team")
  @ResponseStatus(code = HttpStatus.CREATED)
  public Team save(AppUserAuthenticationToken auth, @Valid @RequestBody TeamCreateRequestDTO dto) {
    Team team = dto.toTeam();

    if (teamRepository.existsByNameAndSociety(team.getName(), team.getSociety())) {
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Team with name already exists");
    }

    // Save and return Team (already validated during PreAuthorize)
    return teamRepository.save(team);
  }

  /**
   * Endpoint to delete a team
   * <br/>
   *
   * @param team team code
   */
  @PreAuthorize("@webSecurity.hasPermission(#auth.getPrincipal(), #code, 'TEAM', 'DELETE')")
  @Operation(summary = "delete team")
  @DeleteMapping(path = "/team/{code}")
  public void delete(AppUserAuthenticationToken auth, @PathVariable String code) {
    Team team = teamRepository.findByCode(code).orElseThrow(
        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Team not found"));

    teamRepository.deleteById(team.getId());
  }
}

@Data
class TeamCreateRequestDTO {
  @NotBlank(message = "Team Name is required")
  private String name;
  @NotBlank(message = "Society is required")
  private String society;

  public Team toTeam() {
    return Team.builder()
        .name(name)
        .society(society)
        .build();
  }
}
