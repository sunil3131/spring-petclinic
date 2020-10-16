pipeline {
  
  
    parameters {
        string(name: 'repositoryBranch', defaultValue: 'master', description: 'repositoryBranch')
        string(name: 'repositoryCredential', defaultValue: 'gitlab', description: 'repositoryCredential')
        string(name: 'repositoryUrl', defaultValue: 'https://github.com/sunilh5252/spring-petclinic.git', description: 'repositoryUrl')
        string(name: 'registry', defaultValue: 'sunil5252/demoproject', description: 'registry')
        string(name: 'registryCredential', defaultValue: 'dockerhub', description: 'registryCredential')


 agent any

  stages {
    stage('Clone Repository') {
        steps {
            deleteDir()
            checkout([
              $class: 'GitSCM',
              branches: [[name: "*/${params.repositoryBranch}"]],
              doGenerateSubmoduleConfigurations: false,
              extensions: [],
              submoduleCfg: [],
              userRemoteConfigs: [[
                name: 'origin',
                credentialsId: ${params.repositoryCredential},
                url: ${params.repositoryUrl}
              ]]
            ])
        }
    }

    stage('Build Image') {
        steps {
        sh "docker build -t ${params.registry}:${BUILD_NUMBER} ."
        }
    }

    stage('Publish Image') {
        steps {
          withDockerRegistry([ credentialsId: ${params.registry}, url: '' ]) {
          sh "docker push ${params.registry}:${BUILD_NUMBER}"
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
            sh "docker rmi ${params.registry}:${BUILD_NUMBER}"
          }
          failure {
            echo "Deployment of ${params.registry}:${BUILD_NUMBER} FAILED"
          }
          success {
            echo "Deployment of ${params.registry}:${BUILD_NUMBER} SUCCEEDED"
          }
      }
    }
  }
}
