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
    
    environment {
        DOCKER_USERNAME = credentials('cbab744d-675c-4226-b593-7751c9a93755') // Replace with your Jenkins credentials ID
        DOCKER_PASSWORD = credentials('cbab744d-675c-4226-b593-7751c9a93755') // Replace with your Jenkins credentials ID
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t myapp .'
            }
        }
        
        stage('Test') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'cbab744d-675c-4226-b593-7751c9a93755', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
                sh 'docker run yourproject python -m pytest'
            }
        }
    }
} 