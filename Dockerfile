
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
COPY pom.xml .
RUN mvn -X clean install -DskipTests

FROM openjdk:11.0-jdk-slim
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
