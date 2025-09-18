# Use official Java 21 image
FROM openjdk:21-jdk

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Build only the server module
RUN ./gradlew :server:shadowJar --no-daemon

# Expose Suwayomi default port
EXPOSE 4567

# Run the fat JAR produced by shadowJar
CMD ["java", "-jar", "server/build/libs/Suwayomi-Server-all.jar"]
