package com.campusme.society.security;

import java.io.Serializable;

import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

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
    return true;
  }
}