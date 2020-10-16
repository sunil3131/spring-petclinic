pipeline {
  
  agent any


  parameters {
        string(name: 'repositoryBranch', defaultValue: 'master', description: 'repositoryBranch')
        string(name: 'repositoryCredential', defaultValue: 'gitlab', description: 'repositoryCredential')
        string(name: 'repositoryUrl', defaultValue: 'https://github.com/sunil3131/spring-petclinic.git', description: 'repositoryUrl')
        string(name: 'registry', defaultValue: 'sunil5252/demoproject', description: 'registry')
        string(name: 'registryCredential', defaultValue: 'dockerhub', description: 'registryCredential')

   


}

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

    

    stage('Deployment') {
      steps {
        echo "Deployment COMPLETED"
      }

      post {
        always {
          echo "Deployment COMPLETED"
       
          
        }
        failure {
          echo "Deployment of  FAILED"
        }
        success {
          echo "Deployment of  SUCCEEDED"
        }
      }
    }
  }
}
