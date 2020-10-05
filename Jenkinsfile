pipeline {
  environment {
    registry = "ippeter/rds-tester"
  }
  
  agent any
  
  stages {

    stage('Build Image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

  }
}
