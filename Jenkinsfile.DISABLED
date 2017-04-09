#!groovy

// See https://github.com/volumio/Build

pipeline {
  agent any
  environment {
    TERM = 'linux'
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '2'))
  }
  stages {
    stage('Build custom-image:local') {
      agent { label 'docker' }
      steps {
        sh 'docker build -t volumio-buildenv:local docker/'
      }
    }
    stage('Build') {
      agent { 
        docker {
          image 'volumio-buildenv:local'
          // Run container as root and with CAP_SYS_ADMIN capability
          // See http://stackoverflow.com/questions/36553617/how-do-i-mount-bind-inside-a-docker-container
          args '-u 0:0 --privileged --cap-add=SYS_ADMIN'
        }
      }
      steps {
        // git (url: 'https://github.com/volumio/Build')
        git (url: 'https://github.com/SOLARMA/volumio-Build')
        
        echo 'DEBUG 1'
        sh 'mount'
        sh 'which mount'
        sh 'ls -la $(which mount)'
        sh 'ls -la /dev'
        
        echo 'INFO: Checking whether module binfmt_misc is installed..'
        // sh 'modprobe binfmt_misc'
        sh '''#!/bin/bash

grep -w binfmt_misc /proc/modules >/dev/null || {
    echo "Please execute on your Docker Host: \"sudo modprobe binfmt_misc\""
    exit 1
}
'''

        echo 'DEBUG 2'
        sh 'ls -la build/armv7/root || true'
        sh 'ls -la build/armv7/root/bin/bash || true'
        sh 'file build/armv7/root/bin/bash || true'
        sh 'which find'

        // Configure qemu-arm
        // See http://blog.ubergarm.com/run-arm-docker-images-on-x86_64-hosts/
        sh 'update-binfmts --enable qemu-arm'
        sh 'update-binfmts --display qemu-arm'

        // sh "TERM=linux ./build.sh -b armv7 -d udooneo -v 2.0"
        sh '''#!/bin/bash -xe

# DEBUG
id
pwd

bash -xe ./build.sh -b armv7 -d udooneo -v 2.0 || true

# EOF
'''
      }
    }
  }
}

// EOF
