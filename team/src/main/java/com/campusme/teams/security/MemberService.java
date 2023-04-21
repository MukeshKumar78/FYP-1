package com.campusme.teams.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.teams.config.BearerAuthFeignConfig;
import com.campusme.teams.user.AppUser;

import lombok.Data;

@Data
class SocietyMember {
  private String role;
}

/**
 * HTTP API client for roles in the SECURITY service
 */
@FeignClient(name = "SOCIETY", configuration = BearerAuthFeignConfig.class)
interface FeignMemberClient {
  @GetMapping("/memberships")
  @CrossOrigin
  SocietyMember[] readMember(@RequestParam String society, @RequestParam String user);
}

/**
 * Encapsulates the Feign HTTP API client and provides role-related methods
 */
@Service
public class MemberService {

  @Autowired
  private final FeignMemberClient memberClient;

  public MemberService(FeignMemberClient memberClient) {
    this.memberClient = memberClient;
  }

  public Boolean isMember(String society, String user) {
    try {
      SocietyMember[] members = memberClient.readMember(society, user);
      return members.length > 0;
    } catch (Exception e) {
      return false;
    }
  }

  public String getRole(String society, String user) {
    try {
      SocietyMember[] members = memberClient.readMember(society, user);
      if (members.length > 0)
        return members[0].getRole();
      return "";
    } catch (Exception e) {
      return "";
    }
  }
}
