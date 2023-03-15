package com.campusme.society.member;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.security.RoleService;
import com.campusme.society.society.Society;
import com.campusme.society.society.SocietyRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserAuthenticationToken;
import com.campusme.society.user.AppUserRepository;

/**
 * REST Controller for Society Memberships
 */
@RestController
public class MemberController {
  @Autowired
  private MemberRepository memberRepository;
  @Autowired
  private AppUserRepository userRepository;
  @Autowired
  private SocietyRepository societyRepository;
  @Autowired
  private RoleService roleService;


  /**
   * Endpoint for getting memberships
   * 
   * @param id
   */
  @GetMapping("/memberships")
  public List<Member> memberships(@RequestParam(required = false) String user,
      @RequestParam(required = false) String society) {
    if (society == null && user == null)
      throw new ResponseStatusException(
          HttpStatus.BAD_REQUEST, "Either society or user must be provided");

    List<Member> members;
    if (user == null)
      members = memberRepository.findBySocietyCode(society);
    else
      members = Arrays.asList(
          memberRepository.findByUserCodeAndSocietyCode(user, society).orElseThrow(
              () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Member not found")));

    return members;
  }

  /**
   * Endpoint for adding a membership
   * 
   * @param id   Long
   * @param data MemberCreateRequestDTO
   * @return Member
   * @throws ResponseStatusException: 404 (Society not found), 404 (User not
   *                                  found)
   *                                  400 (User is already a member)
   */
  @PostMapping("/memberships")
  @PreAuthorize("""
      @webSecurity.hasPermission(#auth.getPrincipal(), #dto.getSociety(), 'member', 'add')
      and
      @webSecurity.isRoleHigher(#auth.getPrincipal(), #dto.getSociety(), #dto.getRole())""")
  public Member addMember(AppUserAuthenticationToken auth,
      @Valid @RequestBody MemberCreateRequestDTO dto) {

    Society society = societyRepository.findByCode(dto.getSociety()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    AppUser user = userRepository.findByCode(dto.getUser()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "User not found"));

    if (memberRepository.existsByUserIdAndSocietyId(user.getId(), society.getId()))
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User already is a member");

    Member member = memberRepository.save(
        Member.builder()
            .user(user)
            .society(society)
            .role(dto.getRole()).build());

    return member;
  }

  /**
   * Endpoint for removing a membership
   * 
   * @param id   Long
   * @param data MemberRemoveRequestDTO
   * @throws ResponseStatusException: 404 (Society not found), 404 (User not
   *                                  found)
   *                                  400 (User is not a member)
   */
  @DeleteMapping("/memberships")
  @PreAuthorize("@webSecurity.isUserHigher(#auth.getPrincipal(), #dto.getUser(), #dto.getSociety())")
  public void removeMember(AppUserAuthenticationToken auth,
      @Valid @RequestBody MemberRemoveRequestDTO dto) {
    Society society = societyRepository.findByCode(dto.getSociety()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "Society not found"));

    AppUser user = userRepository.findByCode(dto.getUser()).orElseThrow(
        () -> new ResponseStatusException(
            HttpStatus.NOT_FOUND, "User not found"));

    if (!memberRepository.existsByUserIdAndSocietyId(user.getId(), society.getId()))
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User is not a member");

    memberRepository.deleteByUserIdAndSocietyId(user.getId(), society.getId());

    return;
  }

  @GetMapping("/roles")
  public List<String> roles() {
    return roleService.getRoles();
  }
}
