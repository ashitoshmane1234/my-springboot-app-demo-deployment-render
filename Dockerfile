# Direct render
# # Stage 1: Build the jar inside Docker
# FROM maven:3.9.3-eclipse-temurin-17 AS build

# # Set working directory
# WORKDIR /app

# # Copy pom.xml and download dependencies (caching layer)
# COPY pom.xml .
# RUN mvn dependency:go-offline -B

# # Copy source code
# COPY src ./src

# # Build the project
# RUN mvn clean package -DskipTests

# # Stage 2: Run the jar
# FROM eclipse-temurin:17-jre

# # Set working directory
# WORKDIR /app

# # Copy the jar from the build stage
# COPY --from=build /app/target/*.jar app.jar

# # Expose port (default for Spring Boot)
# EXPOSE 8080

# # Run the application
# ENTRYPOINT ["java","-jar","app.jar"]

# Stage 1: Build
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8001
ENTRYPOINT ["java", "-jar", "app.jar"]
