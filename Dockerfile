# Use Java 21
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy and build the jar
COPY target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]