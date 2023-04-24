package com.campusme.teams.member;

import java.util.Arrays;
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

import com.campusme.teams.team.Team;
import com.campusme.teams.team.TeamRepository;
import com.campusme.teams.user.AppUser;
import com.campusme.teams.user.AppUserAuthenticationToken;
import com.campusme.teams.user.AppUserRepository;
import com.campusme.teams.security.MemberService;

import lombok.Data;

/**
 * REST Controller for Teams
 */
@RestController
public class MemberController {

  @Autowired
  private AppUserRepository userRepository;
  @Autowired
  private TeamRepository teamRepository;
  @Autowired
  private MemberRepository memberRepository;
  @Autowired
  private MemberService societyMemberService;

  /**
   * Endpoint for getting memberships
   * 
   * @param id
   */
  @GetMapping("/team/memberships")
  public List<Member> memberships(AppUserAuthenticationToken auth, @RequestParam(required = false) String user,
      @RequestParam(required = false) String team) {
    if (team == null && user == null) {
      AppUser authUser = (AppUser) auth.getPrincipal();
      return memberRepository.findByUserCode(authUser.getCode());
    }

    if (user != null && team != null) {

      return Arrays.asList(
          memberRepository.findByUserCodeAndTeamCode(user, team).orElseThrow(
              () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Member not found")));
    }

    if (user == null)
      return memberRepository.findByTeamCode(team);
    else
      return memberRepository.findByUserCode(user);
  }

  /**
   * Endpoint for adding a membership
   * 
   * @param id   Long
   * @param data MemberCreateRequestDTO
   * @return Member
   * @throws ResponseStatusException: 404 (Team not found), 404 (User not
   *                                  found)
   *                                  400 (User is already a member)
   */
  @PostMapping("/team/memberships")
  @PreAuthorize("""
      hasRole('ADMIN')
      or
      @webSecurity.hasPermission(#auth.getPrincipal(), #dto.getTeam(), 'TEAM_MEMBER', 'ADD')
      """)
  public Member addMember(AppUserAuthenticationToken auth,
      @Valid @RequestBody MemberUpdateRequestDTO dto) {

    // Get Team
    Team team = teamRepository.findByCode(dto.getTeam()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Team not found"));

    // Check if user is member of society
    if (!societyMemberService.isMember(team.getSociety(), dto.getUser()))
      throw new ResponseStatusException(
          HttpStatus.NOT_FOUND, "User not found");

    // Get user
    AppUser user = userRepository.findByCode(dto.getUser()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "User not found"));

    if (memberRepository.existsByUserIdAndTeamId(user.getId(), team.getId()))
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User already is a member");

    Member member = memberRepository.save(
        Member.builder()
            .user(user)
            .team(team)
            .build());

    return member;
  }

  /**
   * Endpoint for removing a membership
   * 
   * @param id   Long
   * @param data MemberRemoveRequestDTO
   * @throws ResponseStatusException: 404 (Team not found), 404 (User not
   *                                  found)
   *                                  400 (User is not a member)
   */
  @DeleteMapping("/team/memberships")
  @PreAuthorize("""
      hasRole('ADMIN')
      or
      @webSecurity.hasPermission(#auth.getPrincipal(), #dto.getTeam(), 'TEAM_MEMBER', 'REMOVE')
      """)
  public void removeMember(AppUserAuthenticationToken auth,
      @Valid @RequestBody MemberUpdateRequestDTO dto) {
    Team team = teamRepository.findByCode(dto.getTeam()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Team not found"));

    AppUser user = userRepository.findByCode(dto.getUser()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "User not found"));

    if (!memberRepository.existsByUserIdAndTeamId(user.getId(), team.getId()))
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User is not a member");

    memberRepository.deleteByUserIdAndTeamId(user.getId(), team.getId());

    return;
  }
}

@Data
class MemberUpdateRequestDTO {
  @NotBlank(message = "user is required")
  String user;
  @NotBlank(message = "team is required")
  String team;
}
