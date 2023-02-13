package com.campusme.society.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.member.Member;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserRepository;

@Component("webSecurity")
public class WebSecurity {
  @Autowired
  private RoleService roleService;
  @Autowired
  private EventRepository eventRepository;
  @Autowired
  private AppUserRepository appUserRepository;
  /**
   * Returns true if authenticated user is a member in given society
   * 
   * @param societyId
   * @return true or false
   */
  public boolean isMember(AppUser user, Long societyId) {
    return user.getMemberships().stream().anyMatch(m -> m.getSociety().getId() == societyId);
  }

  /**
   * Returns true if authenticated user role in the society is higher than the given role 
   * 
   * @param societyId
   * @return true or false
   */
  public boolean isRoleHigher(AppUser user, Long societyId, String role) {
    Optional<Member> member = user
        .getMemberships().stream()
        .filter(m -> m.getSociety().getId() == societyId)
        .findFirst();

    if(member.isEmpty())
      return false;

    return roleService.isHigher(member.get().getRole(), role);
  }

  /**
   * Returns true if authenticated user role in the society is higher than the given user
   * 
   * @param societyId
   * @return true or false
   */
  public boolean isUserHigher(AppUser higher, String lowerCode, Long societyId) {
    Optional<AppUser> lower = appUserRepository.findByCode(lowerCode);
    if(lower.isEmpty())
      return false;

    Optional<Member> member = lower.get()
        .getMemberships().stream()
        .filter(m -> m.getSociety().getId() == societyId)
        .findFirst();

    if(member.isEmpty())
      return false;

    return isRoleHigher(higher, societyId, member.get().getRole());
  }

  /**
   * returns society ID (targetDomain) given an event ID
   */
  public Long fromEvent(Long eventID) {
    Event event = eventRepository.findById(eventID).orElseThrow(
      () -> new ResponseStatusException(HttpStatus.NOT_FOUND));

    return event.getSociety().getId();
  }

  /**
   * Authorizes user based on given params using
   * {@link com.campusme.society.security.CustomMethodSecurityExpressionRoot#hasPrivilege()}
   * 
   * @param targetDomain the society id
   * @param targetType   the target resource type (e.g. EVENT, COMMENT)
   * @param permission   the permission (e.g. CREATE, PUBLISH, READ ...)
   * @return true or false
   */
  public boolean hasPermission(
      AppUser user, Long targetDomain, String targetType, Object permission) {
    if ((targetType == null) || !(permission instanceof String)) {
      return false;
    }
    return hasPrivilege(user, targetDomain, targetType.toUpperCase(),
        permission.toString().toUpperCase());
  }

  /**
   * 1. Gets user role from SECURITY service based on the society interacted with <br>
   * 2. Checks if the role has requested permission on target object type
   * 
   * @param targetDomain the society id
   * @param targetType   the target resource type (e.g. EVENT, COMMENT)
   * @param permission   the permission (e.g. CREATE, PUBLISH, READ ...)
   * @return true or false
   */
  private boolean hasPrivilege(AppUser user, Long targetDomain, String targetType, String permission) {
    System.out.printf("REQUEST: User(%s) targetDomain(%s) targetType(%s) permission(%s)\n", user.getCode(),
        targetDomain, targetType, permission);

    Optional<Member> member = user
        .getMemberships().stream()
        .filter(m -> m.getSociety().getId() == targetDomain)
        .findFirst();

    if (member.isPresent()) {
      System.out.print(member.get().getRole());
      return roleService.hasPermission(member.get().getRole(), targetType, permission);
    }
    return false;
  }
}
