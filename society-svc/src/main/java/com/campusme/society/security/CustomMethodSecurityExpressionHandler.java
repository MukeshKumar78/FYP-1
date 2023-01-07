package com.campusme.society.security;

import org.springframework.security.access.expression.SecurityExpressionRoot;
import org.springframework.security.access.expression.method.DefaultMethodSecurityExpressionHandler;
import org.springframework.security.access.expression.method.MethodSecurityExpressionOperations;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;

import java.util.Optional;

import org.aopalliance.intercept.MethodInvocation;

import com.campusme.society.member.Member;
import com.campusme.society.user.AppUser;

/**
 * Handler for method-level security on REST controllers
 * <br>
 * Replaces default MethodSecurityExpressionRoot with
 * {@link com.campusme.society.security.CustomMethodSecurityExpressionRoot}
 */
public class CustomMethodSecurityExpressionHandler
    extends DefaultMethodSecurityExpressionHandler {
  private AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
  private final RoleService roleService;

  public CustomMethodSecurityExpressionHandler(RoleService roleService) {
    this.roleService = roleService;
  }

  @Override
  protected MethodSecurityExpressionOperations createSecurityExpressionRoot(
      Authentication authentication, MethodInvocation invocation) {
    CustomMethodSecurityExpressionRoot root = new CustomMethodSecurityExpressionRoot(authentication, roleService);
    root.setPermissionEvaluator(getPermissionEvaluator());
    root.setTrustResolver(this.trustResolver);
    root.setRoleHierarchy(getRoleHierarchy());
    return root;
  }
}

/**
 * Custom method-level security implementation
 * <br>
 * provides custom Pre and Post Authorize functionality by authenticating
 * users based on their joined societies and assigned roles
 */
class CustomMethodSecurityExpressionRoot
    extends SecurityExpressionRoot implements MethodSecurityExpressionOperations {

  private Object filterObject;
  private Object returnObject;
  private final RoleService roleService;

  public CustomMethodSecurityExpressionRoot(Authentication authentication, RoleService roleService) {
    super(authentication);
    this.roleService = roleService;
  }

  /**
   * Returns true if authenticated user is a member in given society
   * 
   * @param societyId
   * @return true or false
   */
  public boolean isMember(long societyId) {
    AppUser user = (AppUser) this.getPrincipal();
    return user.getMemberships().stream().anyMatch(m -> m.getId() == societyId);
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
      Long targetDomain, String targetType, Object permission) {
    if ((targetType == null) || !(permission instanceof String)) {
      return false;
    }
    return hasPrivilege(targetDomain, targetType.toUpperCase(),
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
  private boolean hasPrivilege(Long targetDomain, String targetType, String permission) {
    System.out.printf("REQUEST: User(%s) targetDomain(%s) targetType(%s) permission(%s)\n", authentication.getName(),
        targetDomain, targetType, permission);
    Optional<Member> member = ((AppUser) authentication.getPrincipal())
        .getMemberships().stream()
        .filter(m -> m.getSociety().getId() == targetDomain)
        .findFirst();

    if (member.isPresent()) {
      System.out.print(member.get().getRole());
      return roleService.hasPermission(member.get().getRole(), targetType, permission);
    }
    return false;
  }

  @Override
  public Object getFilterObject() {
    return this.filterObject;
  }

  @Override
  public Object getReturnObject() {
    return this.returnObject;
  }

  @Override
  public Object getThis() {
    return this;
  }

  @Override
  public void setFilterObject(Object obj) {
    this.filterObject = obj;
  }

  @Override
  public void setReturnObject(Object obj) {
    this.returnObject = obj;
  }
}
