package com.campusme.society.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campusme.society.config.BearerAuthFeignConfig;

import feign.FeignException;
import lombok.Data;

@Data
class TeamMember {
  private String id;
  private Team team;
}

@Data
class Team {
  private String code;
  private String society;
}

/**
 * HTTP API client for roles in the SECURITY service
 */
@FeignClient(name = "TEAM", configuration = BearerAuthFeignConfig.class)
interface FeignTeamMemberClient {
  @GetMapping("/memberships")
  @CrossOrigin
  List<TeamMember> readUserMemberships(@RequestParam String user);
}

/**
 * Encapsulates the Feign HTTP API client and provides role-related methods
 */
@Service
public class TeamMemberService {

  @Autowired
  private final FeignTeamMemberClient client;

  public TeamMemberService(FeignTeamMemberClient client) {
    this.client = client;
  }

  public List<TeamMember> getUserMemberships(String user) {
    try {
      return client.readUserMemberships(user);
    } catch (FeignException.NotFound e) {
      return new ArrayList<>();
    }
  }
}
