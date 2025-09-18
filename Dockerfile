# Use official Java 21 image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Build the server module without a daemon
RUN ./gradlew :server:shadowJar

# Expose Suwayomi default port
EXPOSE 4567

# Run the fat JAR
CMD ["java", "-jar", "server/build/libs/Suwayomi-Server-all.jar"]