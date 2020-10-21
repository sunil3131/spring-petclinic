
pipeline {
  
  agent any


  parameters {
        string(name: 'repositoryBranch', defaultValue: 'master', description: 'repositoryBranch')
        string(name: 'repositoryCredential', defaultValue: 'github', description: 'repositoryCredential')
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
            credentialsId: "${params.repositoryCredential}",
            url: "${params.repositoryUrl}"
          ]]
        ])
      }
    }
    stage('commit') 
    {
    steps 
        
    {

    script {
        
        GIT_HASH = sh(returnStdout: true, script: "git rev-parse --short HEAD").trim()
    }
 
    echo "hash is: ${GIT_HASH}"


    }
    }

    stage('Build Image') {
      steps {
        sh "docker build --network host -t ${params.registry}:${GIT_HASH} ."
      }
    }

    stage('Publish Image') {
      steps {
        withDockerRegistry([ credentialsId: "${params.registryCredential}", url: '' ]) {
          sh "docker push ${params.registry}:${GIT_HASH}"
        }
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
