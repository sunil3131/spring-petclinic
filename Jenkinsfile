pipeline {
  environment {
        repositoryBranch = 'master'
        repositoryCredential = 'github1'
        repositoryUrl = 'https://github.com/sunilh5252/spring-petclinic.git'
        registry = "sunil5252/demoproject"
        registryCredential = 'dockerhub'
    
         
  }

 agent any

  stages {
    stage('Clone Repository') {
        steps {
            deleteDir()
            checkout([
              $class: 'GitSCM',
              branches: [[name: "*/${repositoryBranch}"]],
              doGenerateSubmoduleConfigurations: false,
              extensions: [],
              submoduleCfg: [],
              userRemoteConfigs: [[
                name: 'origin',
                credentialsId: repositoryCredential,
                url: repositoryUrl
              ]]
            ])
        }
    }

    stage('Build Image') {
        steps {
        sh "docker build -t ${registry}:${BUILD_NUMBER} ."
        }
    }

    stage('Publish Image') {
        steps {
          withDockerRegistry([ credentialsId: registryCredential, url: '' ]) {
          sh "docker push ${registry}:${BUILD_NUMBER}"
          }
        }
    }


    stage('Junit') {
        steps {
            junit '**/target/surefire-reports/*.xml'
        }
    }


    stage('Deployment') {
      steps {
          deleteDir()
             echo "Deployment COMPLETED"
      }

      post {
          always {
            echo "Deployment COMPLETED"
            deleteDir()
            sh "docker rmi ${registry}:${BUILD_NUMBER}"
          }
          failure {
            echo "Deployment of ${registry}:${BUILD_NUMBER} FAILED"
          }
          success {
            echo "Deployment of ${registry}:${BUILD_NUMBER} SUCCEEDED"
          }
      }
    }
  }
}
