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
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t yourproject .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run yourproject python -m pytest'
            }
        }
    }
} 