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