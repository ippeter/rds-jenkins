pipeline {
  environment {
    baseImage = "cloud-devops/rds-tester"
    swrCredentials = "SWRLogin2"
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
          docker.withRegistry('https://swr.ru-moscow-1.hc.sbercloud.ru/', swrCredentials ) {
            dockerImage.push()
          }
        }
      }
    }
    
    stage('Update Deployment') {
      steps {
        script {         
          sh '''
            kubectl set image deployment/rds-tester container-0="swr.ru-moscow-1.hc.sbercloud.ru/$baseImage:$BUILD_NUMBER"          
          '''          
        }
      }
    }

  }
}
