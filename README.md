# FYP-1

## Start Backend
1. Install docker and docker-compose
- [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- Arch (using yay): `yay -S docker docker-compose`
2. Clone Repo
```
git clone https://github.com/MukeshKumar78/FYP-1
```
3. Start all services
```
cd docker
docker-compose up
```

* Admin Dashboard: [http://localhost:8080/admin](http://localhost:8080/admin)
* API documentation: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
* Service Discovery Dashboard: [http://localhost:8761](http://localhost:8761)
* Society API: [http://localhost:8080/api/core](http://localhost:8080/api/core)
* Teams API: In development

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

### [Start Web/Android app](ui/README.md)

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

