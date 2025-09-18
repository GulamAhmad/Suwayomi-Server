# Use official Java 21 slim image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install build essentials if needed (e.g., git, curl, etc.)
# You may need to install 'build-essential' or similar packages for gradle to work
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Build only the server module
RUN ./gradlew :server:shadowJar --no-daemon

# Expose Suwayomi default port
EXPOSE 4567

# Run the fat JAR produced by shadowJar
CMD ["java", "-jar", "server/build/libs/Suwayomi-Server-all.jar"]