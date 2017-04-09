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
        echo 'Hello, world!'
      }
    }
    stage('Deploy-test') {
      steps {
        echo 'Hello, world!'
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
          sh 'ssh -o StrictHostKeyChecking=no -l pi -p 122 gmhome.solarma.it uname -a'
        }
      }
    }
    stage('Deploy-production') {
      steps {
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
