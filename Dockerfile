FROM openjdk:24-jdk-slim as builder
WORKDIR /app

COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts .
COPY settings.gradle.kts .

COPY src src

RUN chmod +x gradlew

RUN ./gradlew bootJar --no-daemon

FROM openjdk:24-jre-slim

ARG JAR_FILE=app/build/libs/*.jar
COPY --from=builder ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT["java", "-jar", "app.jar"]