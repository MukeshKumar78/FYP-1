# First stage: complete build environment
FROM maven:3.8.5-openjdk-17-slim AS builder

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
COPY --from=builder target/security-0.0.1-SNAPSHOT.jar security-0.0.1-SNAPSHOT.jar

RUN mkdir static
COPY --from=builder /tmp/public/ static/

EXPOSE 8082

COPY docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["java", "-jar", "security-0.0.1-SNAPSHOT.jar"]
