# First stage: complete build environment
FROM maven:3.6.3-jdk-11-slim AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml

RUN mvn verify --fail-never

ADD ./src src/

# package jar
RUN mvn package

# Second stage: minimal runtime environment
FROM openjdk:11-jre-slim

WORKDIR /app

ADD ./META-INF /app/META-INF

# copy jar from the first stage
COPY --from=builder target/teams-svc-0.0.1-SNAPSHOT.jar teams-svc-0.0.1-SNAPSHOT.jar

EXPOSE 8083

CMD ["java", "-jar", "teams-svc-0.0.1-SNAPSHOT.jar"]
