package com.campusme.teams.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.campusme.teams.user.AppUser;

@Component("webSecurity")
public class WebSecurity {
  @Autowired
  private RoleService roleService;
  @Autowired
  private MemberService memberService;

  /**
   * Returns true if authenticated user is a member in given team
   * 
   * @param teamId
   * @return true or false
   */
  public boolean isMember(AppUser user, Long teamId) {
    return user.getMemberships().stream().anyMatch(m -> m.getTeam().getId() == teamId);
  }

  /**
   * Authorizes user based on given params
   * 
   * @param targetDomain the team id
   * @param targetType   the target resource type (e.g. MESSAGE)
   * @param permission   the permission (e.g. CREATE, READ ...)
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
   * 1. Gets user role from SECURITY service based on the team interacted with <br>
   * 2. Checks if the role has requested permission on target object type
   * 
   * @param targetDomain the society id
   * @param targetType   the target resource type (e.g. EVENT, COMMENT)
   * @param permission   the permission (e.g. CREATE, PUBLISH, READ ...)
   * @return true or false
   */
  private boolean hasPrivilege(AppUser user, String targetDomain, String targetType, String permission) {
    System.out.printf("REQUEST: User(%s) targetDomain(%s) targetType(%s) permission(%s)\n", user.getCode(),
        targetDomain, targetType, permission);

    String role = memberService.getRole(targetDomain, user.getCode());
    System.out.print(role);
    return roleService.hasPermission(role, targetType, permission);
  }
}
