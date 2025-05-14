pipeline {
    agent any

    environment {
        IMAGE_NAME = 'rushabh46/flask-app'
        CREDENTIALS_ID = 'dockerhub'  // The ID used in Jenkins Credentials
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Rushabh-Pansuriya/Practice.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${Dockerfile}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${dockerhub}", usernameVariable: 'rushabh46', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$rushabh46" --password-stdin
                        docker push ${Dockerfile}
                    """
                }
            }
        }
    }
}
