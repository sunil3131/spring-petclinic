pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
               git credentialsId: '2df3e1cb-2e7c-4dc1-a507-f4001f621d98', url: 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }
       stage('Build') {
           steps {
            sh label: '', script: 'mvn clean package'
           }
       }  
      stage('s3 upload')  {
          steps {
              s3Upload consoleLogLevel: 'INFO', dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'adhi1231', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: 'target/*jar', storageClass: 'STANDARD', uploadFromSlave: true, useServerSideEncryption: false]], pluginFailureResultConstraint: 'SUCCESS', profileName: 'bucket', userMetadata: []
          }
      }
    }
}
