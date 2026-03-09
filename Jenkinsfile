pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/shalini253/flask-ec2-app.git'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-app-server']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-user@3.237.28.137 "
                    docker pull shalini253/theflaskapp:v1 &&
                    docker stop theflaskapp || true &&
                    docker rm theflaskapp || true &&
                    docker run -d -p 8080:8080 --name theflaskapp shalini253/theflaskapp:v1
                    "
                    '''
                }
            }
        }

    }
}