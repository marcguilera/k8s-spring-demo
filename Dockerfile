FROM maven:3.6-jdk-11-slim as BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM adoptopenjdk:13-jre-hotspot
EXPOSE 8080
VOLUME /tmp
COPY --from=BUILD /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
CMD ["java","-jar","demo.jar"]
