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

ADD ./META-INF /app/META-INF

# copy jar from the first stage
COPY --from=builder target/team-0.0.1-SNAPSHOT.jar team-0.0.1-SNAPSHOT.jar

EXPOSE 8083

CMD ["java", "-jar", "team-0.0.1-SNAPSHOT.jar"]
