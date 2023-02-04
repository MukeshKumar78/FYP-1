# FYP-1

## Development
### Start infra containers
```sh
cd docker && docker-compose up db discovery -d
```

### Start gateway service in development mode
```
cd gateway
./mvnw clean && ./mvnw spring-boot:run
```

### Start society service in development mode
```
cd society
./mvnw clean && ./mvnw spring-boot:run
```

### Start security service in development mode
```
cd security
./mvnw clean && ./mvnw spring-boot:run
```

### Start Web/Android app
refer to the [UI README](ui/README.md)

### Customize environment variables
#### In Bash
```
export EUREKA_HOST=http://localhost:8761/eureka
export JWT_SECRET=9y/B?E(H+KbPeShVmYq3t6w9z$C&F)J@
export STATIC_FILES_LOCATION=/tmp/public/
export POSTGRES_HOST=localhost:5432
export POSTGRES_PASSWORD=postgres
```

#### In docker-compose
edit `docker/.env` and `docker/docker-compose.yml`

