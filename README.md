# FYP-1
# Monolithic arch test

## Start development environment
```
cd docker

# Start db, campusme-api and campusme-ui with autoreload
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up
```
## Services
### db

A postgresql instance
```
# port=5432
# Initialized from ./volumes/db/init.sql

# Enter container
docker exec -it campusme-db /bin/bash

# Run psql
psql -U postgres -Ppostgres

```
### campusme-api

Backend service

A Spring Boot OAuth2 Resource Server + Spring Boot Data Rest Web API
```
# port=8080

# Enter container
docker exec -it campusme-api /bin/bash
```

### campusme-ui
will make tomorrow