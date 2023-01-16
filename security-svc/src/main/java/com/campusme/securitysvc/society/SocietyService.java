package com.campusme.securitysvc.society;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.server.ResponseStatusException;

import com.campusme.securitysvc.home.metrics.RequestsMetric;

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
}

/**
 * HTTP API client for the SOCIETY service
 */
@FeignClient("SOCIETY")
interface FeignSocietyClient {
  @GetMapping("/societies")
  @CrossOrigin
  List<Society> readAll(@RequestHeader Map<String, String> headers);

  @GetMapping("/societies/{code}")
  @CrossOrigin
  Society readOne(@PathVariable String code);

  @GetMapping("/actuator/metrics/http.server.requests")
  @CrossOrigin
  RequestsMetric readRequestsMetrics();
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

  private Map<String, String> getHeaders(HttpServletRequest req) {
    Map<String, String> headers = new HashMap<>();
    String token = "";
    for(var cookie : req.getCookies()) {
      System.out.println("$" + cookie.getName() + "$");
      if(cookie.getName().equals("_token")) {
      System.out.println("YES");
        token = cookie.getValue();
      }
    }
    if(token.isEmpty())
      throw new ResponseStatusException(
          HttpStatus.UNAUTHORIZED);

    headers.put("Authorization", String.format("Bearer %s", token));

    return headers;
  }

  public List<Society> findAll(HttpServletRequest req) {
    return client.readAll(getHeaders(req));
  }

  public RequestsMetric getSocietyRequestsMetrics() {
    return client.readRequestsMetrics();
  }
}
