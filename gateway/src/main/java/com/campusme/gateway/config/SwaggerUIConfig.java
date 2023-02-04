package com.campusme.gateway.config;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springdoc.core.AbstractSwaggerUiConfigProperties.SwaggerUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SwaggerUIConfig {

  @Autowired
  private DiscoveryClient discoveryClient;

  @GetMapping("/swagger-config.json")
  public Map<String, Object> swaggerConfig() {
    Map<String, Object> config = new LinkedHashMap<>();
    List<SwaggerUrl> urls = new LinkedList<>();
    discoveryClient.getServices()
        .forEach(serviceName -> discoveryClient.getInstances(serviceName).forEach(serviceInstance -> urls
            .add(new SwaggerUrl(serviceName, serviceInstance.getUri() + "/v3/api-docs", serviceName))));
    config.put("urls", urls);
    return config;
  }
}
