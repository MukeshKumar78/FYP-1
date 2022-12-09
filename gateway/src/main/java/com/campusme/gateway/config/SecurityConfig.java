package com.campusme.gateway.config;


import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;

@Configuration
public class SecurityConfig {

    // TODO: use asymmetric keys. also don't hardcode
    private final byte[] decodedKey = "9y/B?E(H+KbPeShVmYq3t6w9z$C&F)J@".getBytes();
    private final SecretKey key = new SecretKeySpec(decodedKey, 0, decodedKey.length, "HmacSHA256");

    // External JWT security for login routes
    @Bean
    @Order(1)
    public SecurityFilterChain loginFilterChain(HttpSecurity http) throws Exception {
        byte[] otherDecodedKey = "8y/B?E(H+KbPeShVmYq3t6w9z$C&F)J@".getBytes();
        SecretKey otherKey = new SecretKeySpec(otherDecodedKey, 0, otherDecodedKey.length, "HmacSHA256");
        // SecretKey secretKey = KeyGenerator.getInstance("AES").generateKey();
        // http.authorizeRequests(authorize -> authorize
        //         .antMatchers("/login").fullyAuthenticated()
        //         )
        //         .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        //         .and()
        //         .oauth2ResourceServer().jwt()
        //         .and()
        //     .and()
        //     .cors().and().csrf().disable();
    
        // TODO: Use Google^ here  
        http
          .antMatcher("/token")
          .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
              .decoder(NimbusJwtDecoder.withSecretKey(otherKey).build()
            )
          )
        )
        .authorizeRequests().anyRequest().authenticated();

      return http.build();
    }

    // Internal JWT security
    @Bean
    @Order(2)
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // TODO: save secret key in config
        http.authorizeRequests(authorize -> authorize
          .antMatchers("/**").fullyAuthenticated()
          )
          .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
              .decoder(NimbusJwtDecoder.withSecretKey(key).build()
            )
          )
        );

      return http.build();
    }
  
  @Bean
  public JwtEncoder jwtEncoder() {
    JWKSource<SecurityContext> jwks = new ImmutableSecret<SecurityContext>(key);
    return new NimbusJwtEncoder(jwks);
  }

}
