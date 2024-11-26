// This Jenkinsfile defines a CI/CD pipeline with 3 stages:

// 1. Checkout stage:
//    - Checks out the source code from version control using 'checkout scm'
//    - This gets the latest code from the repository

// 2. Build stage: 
//    - Builds a Docker image named 'yourproject' from the Dockerfile
//    - The '-t' flag tags the image with the name 'yourproject'

// 3. Test stage:
//    - Runs the test suite using pytest inside the Docker container
//    - Uses the previously built 'yourproject' image
//    - Executes 'python -m pytest' to run all tests

pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t my-flask-app .'
        sh 'docker tag my-flask-app $sandeepsurekas/myapp:latest'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run my-flask-app python -m pytest app/tests/'
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'sandeepsurekas', passwordVariable: 'dckr_pat_vlN2X9a9CAaeqh9_N8p3epeTiq4', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          sh 'docker push $sandeepsurekas/myapp:latest'
        }
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}