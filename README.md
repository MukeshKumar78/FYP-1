# FYP-1

## Start Backend
1. Install docker and docker-compose
- [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- Arch (using yay): `yay -S docker docker-compose`
2. Clone Repo
```sh
git clone https://github.com/MukeshKumar78/FYP-1
cd FYP-1
```
3. Configure default docker env
```sh
cp docker/example.env docker/.env
```
4. Start all services
```sh
docker-compose -f docker/docker-compose.yml up
```

* Admin Dashboard: [http://localhost:8080/admin](http://localhost:8080/admin)
* API documentation: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
* Service Discovery Dashboard: [http://localhost:8761](http://localhost:8761)
* Society API: [http://localhost:8080/api/core](http://localhost:8080/api/core)
* Teams API: In development

## [Start Web/Android app](./ui/README.md)

## Development
### Start infra containers
```sh
docker-compose -f docker/docker-compose.yml up db discovery -d
```

### Start services
```sh
# multiple at once using tmux
./dev.sh --tmux gateway society security

# one at a time
./dev.sh gateway
```

### Customize environment variables
#### In Bash
```sh
export EUREKA_HOST=http://localhost:8761/eureka
export JWT_SECRET=9y/B?E(H+KbPeShVmYq3t6w9z$C&F)J@
export STATIC_FILES_LOCATION=/tmp/public/
export POSTGRES_HOST=localhost:5432
export POSTGRES_PASSWORD=postgres
```

#### In docker-compose
edit `docker/.env` and `docker/docker-compose.yml`

