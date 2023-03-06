package com.campusme.teams.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.campusme.teams.config.BearerAuthFeignConfig;

import lombok.Data;

@Data
class SocietyMember {
  private String role;
}

/**
 * HTTP API client for roles in the SECURITY service
 */
@FeignClient(name = "SOCIETY", configuration=BearerAuthFeignConfig.class)
interface FeignMemberClient {
  @GetMapping("/societies/{societyCode}/memberships/{userCode}")
  @CrossOrigin
  SocietyMember readMember(@PathVariable String societyCode, @PathVariable String userCode);
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

  public String getRole(String society, String user) {
    return memberClient.readMember(society, user).getRole();
  }
}
