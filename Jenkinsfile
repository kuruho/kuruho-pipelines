pipeline {
  agent any
  stages {
    stage('Build-backend') {
      steps {
        parallel(
          "Build-backend": {
            echo 'TODO: Building backend'
            
          },
          "Build-frontend": {
            echo 'TODO: Building frontend'
            
          }
        )
      }
    }
    stage('Test-on-CI') {
      steps {
        echo 'TODO: Testing on CI'
      }
    }
    stage('Deploy-on-staging') {
      steps {
        echo 'TODO: Deploying on staging'
      }
    }
    stage('Test-on-staging') {
      steps {
        echo 'TODO: Test on staging'
        input message: "Does http://localhost:8888/staging/ look good?"
      }
    }
    stage('Deploy-in-production') {
      steps {
        echo 'TODO: Deploy in production'
      }
    }
  }
}
