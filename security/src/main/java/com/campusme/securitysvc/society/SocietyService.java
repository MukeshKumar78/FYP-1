package com.campusme.securitysvc.society;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.campusme.securitysvc.config.BearerAuthFeignConfig;

import feign.Headers;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
class Society {
  Long id;
  String code;
  String description;
  String name;
  String fullName;
  String image;
  Date createdAt;
  Tenure tenure;
}

@Data
class Tenure {
  Long id;
  String code;
  String description;
  String duration;
  List<Society> societies;
}

@Data
class User {
  private String code;
}

@Data
class Member {
  private User user;
  private String role;
  private Society society;
}

@Data
@AllArgsConstructor
class MemberDTO {
  private String user;
  private String role;
  private String society;
}

/**
 * HTTP API client for the SOCIETY service
 */
@FeignClient(name = "SOCIETY", configuration = BearerAuthFeignConfig.class)
interface FeignSocietyClient {
  @GetMapping("/societies")
  @CrossOrigin
  List<Society> readAllSocieties();

  @GetMapping("/societies/{code}")
  @CrossOrigin
  Society readOneSociety(@PathVariable String code);

  @GetMapping("/memberships?society={code}")
  @CrossOrigin
  List<Member> readSocietyMembers(@PathVariable String code);

  @DeleteMapping("/memberships")
  @CrossOrigin
  void deleteMember(@RequestBody MemberDTO dto);

  @PostMapping("/memberships")
  @CrossOrigin
  void addMember(@RequestBody MemberDTO dto);

  @GetMapping("/tenures/{id}/societies")
  @CrossOrigin
  List<Society> readTenureSocieies(@PathVariable Long id);

  @PostMapping(path = "/tenures/{id}/societies", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
  @CrossOrigin
  @Headers("Content-Type: multipart/form-data")
  Society create(@PathVariable Long id, @ModelAttribute SocietyCreateDTO society);

  @GetMapping("/tenures")
  @CrossOrigin
  List<Tenure> readAllTenures();
}

/**
 * Encapsulates the Feign HTTP API client and provides society-related methods
 */
@Service
public class SocietyService {
  @Autowired
  private final FeignSocietyClient client;

  public SocietyService(FeignSocietyClient client) {
    this.client = client;
  }

  public List<Society> findAllSocieties() {
    return client.readAllSocieties();
  }

  public Optional<Society> findByCode(String code) {
    try {
      return Optional.of(client.readOneSociety(code));
    } catch (Exception e) {
      return Optional.empty();
    }
  }

  public List<Member> findSocietyMembers(String code) {
    return client.readSocietyMembers(code);
  }

  public void deleteMembership(MemberDTO dto) {
    client.deleteMember(dto);
  }

  public void addMembership(MemberDTO dto) {
    client.addMember(dto);
  }

  public List<Tenure> findAllTenures() {
    return client.readAllTenures();
  }

  public Society save(Long tenureID, SocietyCreateDTO society) {
    return client.create(tenureID, society);
  }
}
