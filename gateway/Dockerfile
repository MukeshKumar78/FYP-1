# First stage: complete build environment
FROM maven:3.8.1-openjdk-17-slim AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml

RUN mvn verify --fail-never

ADD ./src src/

# package jar
RUN mvn package

# Second stage: minimal runtime environment
FROM openjdk:17-slim

WORKDIR /app

# copy jar from the first stage
COPY --from=builder target/gateway-0.0.1-SNAPSHOT.jar gateway-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "gateway-0.0.1-SNAPSHOT.jar"]
