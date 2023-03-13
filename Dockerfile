FROM openjdk:11
COPY ./target/mini_project-1.0-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "mini-1.0-SNAPSHOT.jar"]