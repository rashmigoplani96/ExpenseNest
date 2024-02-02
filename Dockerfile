FROM openjdk:20-jdk
EXPOSE 8080
 # ./mvnw install to create jar file
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]