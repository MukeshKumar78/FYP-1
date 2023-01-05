package com.campusme.society.security;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

/**
 * @deprecated
 */
public class CustomPermissionEvaluator implements PermissionEvaluator {

  @Override
  public boolean hasPermission(
      Authentication auth, Object targetDomainObject, Object permission) {
    if ((auth == null) || (targetDomainObject == null) || !(permission instanceof String)) {
      return false;
    }
    String targetType = targetDomainObject.getClass().getSimpleName().toUpperCase();

    return hasPrivilege(auth, targetType, permission.toString().toUpperCase());
  }

  public boolean hasPermissionOnCollection(
      Authentication auth, Collection<Object> targetDomainObjects, Object permission) {

    System.out.println("HERE");
    if ((auth == null) || !(permission instanceof String)) {
      return false;
    }
    for (Object targetDomainObject : targetDomainObjects) {
      if (!hasPermission(auth, targetDomainObject, permission))
        return false;
    }
    return true;
  }

  @Override
  public boolean hasPermission(
      Authentication auth, Serializable targetId, String targetType, Object permission) {
    if ((auth == null) || (targetType == null) || !(permission instanceof String)) {
      return false;
    }
    return hasPrivilege(auth, targetType.toUpperCase(),
        permission.toString().toUpperCase());
  }

  private boolean hasPrivilege(Authentication auth, String targetType, String permission) {
    System.out.printf("REQUEST: User(%s) targetType(%s) permission(%s)\n", auth.getName(), targetType, permission);
    return true;
  }
}
