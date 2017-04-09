pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build-backend": {
            echo 'TODO: Building backend'
            ws(dir: 'backend') {
              sh 'node --version || true'
              sh 'npm --version || true'
              git 'https://github.com/kuruho/backend'
            }
            
            
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
        input 'Does http://localhost:8888/staging/ look good?'
      }
    }
    stage('Deploy-in-production') {
      steps {
        echo 'TODO: Deploy in production'
      }
    }
  }
}