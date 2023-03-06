package com.campusme.society.config;

import java.util.Optional;

import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.prepost.PreAuthorize;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;

@Configuration
@OpenAPIDefinition(info = @Info(title = "Society API", version = "v1"))
public class SwaggerConfig {

  /**
   * Adds Role and Permission info to swagger
   */
  @Bean
  public OperationCustomizer operationCustomizer() {
    return (operation, handlerMethod) -> {
      Optional<PreAuthorize> preAuthorizeAnnotation = Optional
          .ofNullable(handlerMethod.getMethodAnnotation(PreAuthorize.class));
      StringBuilder sb = new StringBuilder();
      if (preAuthorizeAnnotation.isPresent()) {
        sb.append("<b>Access Privileges & Rules</b>: ")
            .append((preAuthorizeAnnotation.get()).value());
      }
      sb.append("<br /><br />");

      operation.setDescription(sb.toString());
      return operation;
    };
  }

  /**
   * Adds an Authorize button to swagger UI using Bearer Auth
   */
  @Bean
  public OpenAPI customOpenAPI() {
    final String securitySchemeName = "bearerAuth";
    return new OpenAPI()
        .addSecurityItem(new SecurityRequirement().addList(securitySchemeName))
        .components(
            new Components()
                .addSecuritySchemes(securitySchemeName,
                    new SecurityScheme()
                        .type(SecurityScheme.Type.HTTP)
                        .scheme("bearer")
                        .bearerFormat("JWT")));
  }
}
