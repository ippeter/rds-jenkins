pipeline {
  environment {
    baseImage = "ippeter/rds-tester"
    SWRCredentials = "SWRLogin2"
  }
  
  agent any
  
  stages {

    stage('Build Image') {
      steps {
        script {
          dockerImage = docker.build baseImage + ":$BUILD_NUMBER"
        }
      }
    }
    
    stage('Push Image') {
      steps {
        script {
          docker.withRegistry('swr.ru-moscow-1.hc.sbercloud.ru/cloud-devops/', SWRCredentials ) {
            dockerImage.push()
          }
        }
      }
    }

  }
}
