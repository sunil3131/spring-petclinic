FROM ubuntu
RUN mvn clean package sonar:sonar -Dsonar.projectKey=test -Dsonar.host.url=http://54.158.192.221:9002 -Dsonar.login=465e946274ca07e39923c0b56ffc29dbc4961471
