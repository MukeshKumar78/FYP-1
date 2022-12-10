<center><h1>API Gateway</h1></center>

## Get Started
```
# Load variables (TODO)
export JWT_EXTERNAL_ONE_ISSUER=https://idp.example.org/issuerOne
export JWT_EXTERNAL_ONE_JWK_SET=https://idp.example.org/certs
export JWT_INTERNAL_SECRET=YOUR_JWT_SECRET

# Run server
./mvnw spring-boot:run

# Package
./mvnw package

# Clean
./mvnw clean

# Docker build
docker build .
```

## Authentication
### Requirements
* Must support multiple external OAuth2 providers
* Must use an OAuth2 flow that supports mobile apps

### Ideas
* Authenticate using ID tokens [1]

We have 2 options for passing down user details to downstream services [2]
1. **Token propagation**
    - Tokens are passed down to services as is. Other services re-verify against the auth server to get user details.
    - This can introduce a lot of latency if external services are queried multiple times per request

![](https://www.baeldung.com/wp-content/uploads/2022/01/spring_gateway_resource_server.png)

2. **Token replacement**
* Currently, there are two security filter chains in place.

    - For the `/token` route, the client sends an id token and receives a custom signed JWT token specific to this app.
    ```
    http
        .antMatcher("/token")
        .antMatcher("/me")
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        .and()
        .oauth2ResourceServer().jwt()
        .and()
        .and()
        .cors().and().csrf().disable();
    ```
    - Rest of the routes are authenticated using this token and other services can decrypt this token to get user details.
    ```
    http.authorizeRequests(authorize -> authorize
        .antMatchers("/**").fullyAuthenticated())
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(jwt -> jwt
                .decoder(NimbusJwtDecoder.withSecretKey(key).build())));
    ```
    - External authorization servers are only contacted once for login and every time the internal token expires

### Future Work
* Support multitenancy [3]
* Create a separate Authorization server with key rotation 
* Use access tokens for internal authorization instead

## Routing
### Requirements
* Must act as the only gateway for general users
* Must provide an interface to view routes and monitor their usage 

## References
[1] https://developers.google.com/identity/one-tap/android/idtoken-auth

[2] https://www.baeldung.com/spring-cloud-gateway-oauth2

[3] https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server/multitenancy.html
