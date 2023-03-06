package com.campusme.society.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.society.event.Event;
import com.campusme.society.event.EventRepository;
import com.campusme.society.member.Member;
import com.campusme.society.post.Post;
import com.campusme.society.post.PostRepository;
import com.campusme.society.user.AppUser;
import com.campusme.society.user.AppUserRepository;

@Component("webSecurity")
public class WebSecurity {
  @Autowired
  private RoleService roleService;
  @Autowired
  private EventRepository eventRepository;
  @Autowired
  private PostRepository postRepository;
  @Autowired
  private AppUserRepository appUserRepository;

  /**
   * Returns true if authenticated user is a member in given society
   * 
   * @param society
   * @return true or false
   */
  public boolean isMember(AppUser user, String society) {
    return user.getMemberships().stream().anyMatch(m -> m.getSociety().getCode().equals(society));
  }

  /**
   * Returns true if authenticated user role in the society is higher than the given role 
   * 
   * @param society
   * @return true or false
   */
  public boolean isRoleHigher(AppUser user, String society, String role) {
    Optional<Member> member = user
        .getMemberships().stream()
        .filter(m -> m.getSociety().getCode().equals(society))
        .findFirst();

    if(member.isEmpty())
      return false;

    return roleService.isHigher(member.get().getRole(), role);
  }

  /**
   * Returns true if authenticated user role in the society is higher than the given user
   * 
   * @param society
   * @return true or false
   */
  public boolean isUserHigher(AppUser higher, String lowerCode, String society) {
    Optional<AppUser> lower = appUserRepository.findByCode(lowerCode);
    if(lower.isEmpty())
      return false;

    Optional<Member> member = lower.get()
        .getMemberships().stream()
        .filter(m -> m.getSociety().getCode().equals(society))
        .findFirst();

    if(member.isEmpty())
      return false;

    return isRoleHigher(higher, society, member.get().getRole());
  }

  /**
   * returns society Code (targetDomain) given an event ID
   */
  public String fromEvent(Long eventID) {
    Event event = eventRepository.findById(eventID).orElseThrow(
      () -> new ResponseStatusException(HttpStatus.NOT_FOUND));

    return event.getSociety().getCode();
  }

  /**
   * returns society Code (targetDomain) given a Post ID
   */
  public String fromPost(Long postID) {
    Post post = postRepository.findById(postID).orElseThrow(
      () -> new ResponseStatusException(HttpStatus.NOT_FOUND));

    return fromEvent(post.getEvent().getId());
  }

  /**
   * Authorizes user based on given params using
   * {@link com.campusme.society.security.CustomMethodSecurityExpressionRoot#hasPrivilege()}
   * 
   * @param targetDomain the society code
   * @param targetType   the target resource type (e.g. EVENT, COMMENT)
   * @param permission   the permission (e.g. CREATE, PUBLISH, READ ...)
   * @return true or false
   */
  public boolean hasPermission(
      AppUser user, String targetDomain, String targetType, Object permission) {
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
   * @param targetDomain the society code
   * @param targetType   the target resource type (e.g. EVENT, COMMENT)
   * @param permission   the permission (e.g. CREATE, PUBLISH, READ ...)
   * @return true or false
   */
  private boolean hasPrivilege(AppUser user, String targetDomain, String targetType, String permission) {
    System.out.printf("REQUEST: User(%s) targetDomain(%s) targetType(%s) permission(%s)\n", user.getCode(),
        targetDomain, targetType, permission);

    Optional<Member> member = user
        .getMemberships().stream()
        .filter(m -> m.getSociety().getCode().equalsIgnoreCase(targetDomain))
        .findFirst();

    if (member.isPresent()) {
      System.out.print(member.get().getRole());
      return roleService.hasPermission(member.get().getRole(), targetType, permission);
    }
    return false;
  }
}
