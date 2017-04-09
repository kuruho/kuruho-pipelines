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
              sh 'cd backend'
              // See https://issues.jenkins-ci.org/browse/JENKINS-33510
              sh 'pwd'
              sh 'ls -la'
              sh 'npm --verbose install'
              sh 'NODE_ENV=production PORT=7001 VOLUMIO_WS=ws://192.168.40.61 node app.js'
            }
          },
          "Build-frontend": {
            echo 'INFO: Testing buildenv for frontend'
            ws(dir: 'frontend') {
              // sh 'node --version || true'
              // sh 'npm --version || true'
              // echo 'INFO: Building frontend'
              // sh 'pwd'
              // sh 'ls -la'
              // git 'https://github.com/kuruho/frontend'
              // sh 'pwd'
              // sh 'ls -la'
              // sh 'npm --version'
              // sh 'npm --verbose install'
              // sh 'PORT=7000 WEBSOCKET_URL=http://localhost:7001 npm start'
              
              sh '''#!/bin/bash -xe

node --version || true
npm --version || true
pwd
ls -la
rm -rf frontend
git clone https://github.com/kuruho/frontend
cd frontend
pwd
ls -la
npm --version
npm --verbose install
PORT=7000 WEBSOCKET_URL=http://localhost:7001 npm start
'''
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
        // input message: "Does http://localhost:8888/staging/ look good?"
        input message: "Does everything look good on your staging system?"
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
