# First stage: complete build environment
FROM maven:3.6.3-jdk-11-slim AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean package

# Second stage: minimal runtime environment
FROM openjdk:11-jre-slim

# copy jar from the first stage
COPY --from=builder target/discovery-0.0.1-SNAPSHOT.jar discovery-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "discovery-0.0.1-SNAPSHOT.jar"]
