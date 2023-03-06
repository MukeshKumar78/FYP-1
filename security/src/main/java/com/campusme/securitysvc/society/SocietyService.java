package com.campusme.securitysvc.society;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.campusme.securitysvc.config.BearerAuthFeignConfig;

import feign.Headers;
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

/**
 * HTTP API client for the SOCIETY service
 */
@FeignClient(
  name="SOCIETY",
  configuration=BearerAuthFeignConfig.class
)
interface FeignSocietyClient {
  @GetMapping("/societies")
  @CrossOrigin
  List<Society> readAllSocieties();

  @GetMapping("/societies/{code}")
  @CrossOrigin
  Society readOneSociety(@PathVariable String code);

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

  public List<Tenure> findAllTenures() {
    return client.readAllTenures();
  }

  public Society save(Long tenureID, SocietyCreateDTO society) {
    return client.create(tenureID, society);
  }
}
