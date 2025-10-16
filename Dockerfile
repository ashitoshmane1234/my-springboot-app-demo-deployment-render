# Stage 1: Build the jar inside Docker
FROM maven:3.9.3-eclipse-temurin-21 AS build

WORKDIR /app

# Copy pom.xml and download dependencies first (cache)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the jar
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copy jar from builder
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]