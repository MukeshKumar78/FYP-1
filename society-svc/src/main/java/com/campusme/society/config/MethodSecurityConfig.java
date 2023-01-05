package com.campusme.society.config;

import com.campusme.society.security.CustomMethodSecurityExpressionHandler;
import com.campusme.society.security.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.GlobalMethodSecurityConfiguration;

/**
 * Configures custom method-level security for REST controllers
 * <br>
 * Replaces default handler with {@link com.campusme.society.security.CustomMethodSecurityExpressionHandler}
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class MethodSecurityConfig extends GlobalMethodSecurityConfiguration {

  @Autowired
  private final RoleService roleService;

  public MethodSecurityConfig(RoleService roleService) {
    this.roleService = roleService;
  }

  @Override
  protected MethodSecurityExpressionHandler createExpressionHandler() {
    final CustomMethodSecurityExpressionHandler expressionHandler = new CustomMethodSecurityExpressionHandler(roleService);
    return expressionHandler;
  }
}
