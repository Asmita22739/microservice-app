pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        DOCKER_IMAGE = "your-dockerhub-username/microservice-app"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/microservice-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t : .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo  | docker login -u ubuntu --password-stdin"
                    sh "docker push :"
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl set image deployment/microservice-deployment microservice-container=: -n myapp || true'
            }
        }
    }
}
