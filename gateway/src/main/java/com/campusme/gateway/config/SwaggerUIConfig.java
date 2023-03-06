package com.campusme.gateway.config;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springdoc.core.AbstractSwaggerUiConfigProperties.SwaggerUrl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SwaggerUIConfig {
  // @Autowired
  // private DiscoveryClient discoveryClient;

  @GetMapping("/swagger-config.json")
  public Map<String, Object> swaggerConfig() {
    Map<String, Object> config = new LinkedHashMap<>();
    List<SwaggerUrl> urls = Arrays.asList(
      new SwaggerUrl("gateway", "/v3/api-docs", "gateway"),
      new SwaggerUrl("society", "/api/core/v3/api-docs", "society"),
      new SwaggerUrl("security", "/admin/v3/api-docs", "security"),
      new SwaggerUrl("teams", "/api/team/v3/api-docs", "teams")
    );

    // discoveryClient.getServices()
    //     .forEach(serviceName -> discoveryClient.getInstances(serviceName).forEach(serviceInstance -> urls
    //         .add(new SwaggerUrl(serviceName, serviceInstance.getUri() + "/v3/api-docs", serviceName))));
    config.put("urls", urls);
    return config;
  }
}
