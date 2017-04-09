pipeline {
  agent {
    dockerfile true
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '2'))
  }
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build-backend": {
            echo 'INFO: Testing buildenv for backend'
            ws(dir: 'backend') {
              sh 'node --version || true'
              sh 'npm --version || true'
              echo 'INFO: Building backend'
              git 'https://github.com/kuruho/backend'
              sh 'pwd'
              sh 'ls -la'
              // TODO sh './envsetup.sh'
            }
          },
          "Build-frontend": {
            echo 'INFO: Testing buildenv for frontend'
            ws(dir: 'frontend') {
              sh 'node --version || true'
              sh 'npm --version || true'
              echo 'INFO: Building frontend'
              git 'https://github.com/kuruho/frontend'
              sh 'npm install'
              // sh 'PORT=8000 npm start'
            }
          }
        )
      }
    }
    stage('Test-on-CI') {
      steps {
        echo 'TODO: Testing on CI'
      }
    }    
    stage('Deploy-to-staging') {
      steps {
        echo 'TODO: Deploy to staging'
        sh '''#!/bin/bash

# DEBUG
id
cat /proc/version
cat /etc/os-release
ssh -V
ssh

ls -la

# Make sure the deployment private key is available
# if [ -e aws-droidcon.key ]; then { echo "docker cp $HOME/ssh/id_rsa myjenkins:/xxx/aws-droidcon.key" }

# Remote login to udooneogm01 via rpi3gm23
# ssh -J pi@gmhome.solarma.it:122 udooer@10.23.3.31 "hostname"
# ssh -p 122 pi@gmhome.solarma.it ssh udooer@10.23.3.31 "hostname"
# TODO

# EOF
'''
        // See https://jenkins.io/doc/pipeline/steps/ssh-agent/
        sshagent (credentials: ['deploy-dev']) {
          echo "DEBUG: Inside SSH Agent"
          // sh 'ssh -o StrictHostKeyChecking=no -l cloudbees 192.168.1.106 uname -a'
          // sh 'ssh -o StrictHostKeyChecking=no -l pi -p 122 gmhome.solarma.it uname -a'
        }
      }
    }
    stage('Test-on-staging') {
      steps {
        echo 'TODO: Test on staging'
        input message: "Does http://localhost:8888/staging/ look good?"
      }
    }    
    stage('Deploy-to-production') {
      steps {
        echo 'TODO: Deploy to production'
        echo 'Hello, world!'
        
        sh '''#!/bin/bash

# Remote login to kuruho-udooquad via rpi3gm23,chipgm32
# ssh -J pi@gmhome.solarma.it:122,10.23.3.32 udooer@192.168.40.10 "hostname"
# TODO

# EOF
'''
      }
    }    
  }
}
