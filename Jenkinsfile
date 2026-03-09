pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/shalini253/flask-ec2-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t shalini253/theflaskapp:v1 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push shalini253/theflaskapp:v1'
                }
            }
        }

        stage('Deploy on EC2') {
            steps {
                sshagent(['ec2-app-server']) {
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@98.93.95.60 "docker pull shalini253/theflaskapp:v1 && docker stop theflaskapp || true && docker rm theflaskapp || true && docker run -d -p 8080:8080 --name theflaskapp shalini253/theflaskapp:v1"'
                }
            }
        }
    }
}