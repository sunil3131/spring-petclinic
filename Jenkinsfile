pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
        git 'https://github.com/sunilh5252/spring-petclinic.git'
            }
        }
        stage('build&Analysis') { 
            steps {
                sh label: '', script: '''mvn clean package 
                         '''
            } 
            
        }
        stage('Junit') {
        steps {
            junit '**/target/surefire-reports/*.xml'
        }
    }
        stage('artifact deploy to s3') {
        steps {
            echo "deploy to s3"
        }
    }
    }}
