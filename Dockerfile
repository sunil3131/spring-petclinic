FROM ubuntu
RUN apt-get update -y && apt-get install default-jre -y && apt-get install default-jdk -y
RUN java -jar /var/lib/jenkins/workspace/pipeline/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar

