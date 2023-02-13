package com.campusme.society.member;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

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

  /**
   * Endpoint for getting all memberships in a society
   * 
   * @param id
   */
  @GetMapping("/societies/{id}/memberships")
  public List<Member> memberships(@PathVariable Long id) {
    List<Member> members = memberRepository.findBySocietyId(id);

    return members;
  }

  /**
   * Endpoint for adding a membership
   * 
   * @param id Long
   * @param data MemberCreateRequestDTO
   * @return Member
   * @throws ResponseStatusException: 404 (Society not found), 404 (User not found)
   *                                  400 (User is already a member)
   */
  @PostMapping("/societies/{id}/memberships")
  @PreAuthorize("""
    @webSecurity.hasPermission(#auth.getPrincipal(), #id, 'member', 'add')
    and 
    @webSecurity.isRoleHigher(#auth.getPrincipal(), #id, #data.getRole())""")
  public Member addMember(AppUserAuthenticationToken auth, @PathVariable Long id, @Valid @RequestBody MemberCreateRequestDTO data) {
    Society society = societyRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "Society not found"));
    
    AppUser user = userRepository.findByCode(data.getUser()).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "User not found"));

    if(memberRepository.existsByUserIdAndSocietyId(user.getId(), society.getId())) 
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User already is a member");

    Member member = memberRepository.save(
      Member.builder()
      .user(user)
      .society(society)
      .role(data.getRole()).build()
    );

    return member;
  }

  /**
   * Endpoint for removing a membership
   * 
   * @param id Long
   * @param data MemberRemoveRequestDTO
   * @throws ResponseStatusException: 404 (Society not found), 404 (User not found)
   *                                  400 (User is not a member)
   */
  @DeleteMapping("/societies/{id}/memberships")
  @PreAuthorize("@webSecurity.isUserHigher(#auth.getPrincipal(), #data.getUser(), #id)")
  public void removeMember(AppUserAuthenticationToken auth, @PathVariable Long id, @Valid @RequestBody MemberRemoveRequestDTO data) {
    Society society = societyRepository.findById(id).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "Society not found"));
    
    AppUser user = userRepository.findByCode(data.getUser()).orElseThrow(
      () -> new ResponseStatusException(
          HttpStatus.NOT_FOUND, "User not found"));

    if(!memberRepository.existsByUserIdAndSocietyId(user.getId(), society.getId())) 
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "User is not a member");

    memberRepository.deleteByUserIdAndSocietyId(user.getId(), society.getId());

    return;
  }
}
