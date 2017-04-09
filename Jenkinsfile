pipeline {
  agent any
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
ssh -V
ssh --help

# Remote login to udooneomv30 via rpi3gm23
# ssh -J pi@gmhome.solarma.it:122 udooer@10.23.3.30 "hostname"
# TODO

# EOF
'''
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
