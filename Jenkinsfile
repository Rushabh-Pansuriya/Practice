pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rushabh46/flask-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository...'
                git url: 'https://github.com/Rushabh-Pansuriya/Practice.git', branch: 'main'
            }
        }
        stage('Test Docker Access') {
            steps {
                sh 'docker ps'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t rushabh46/flask-app .'
            }
        }

        stage('Test Application') {
            steps {
                echo 'Running application tests...'
                sh 'docker run --rm rushabh46/flask-app python -m unittest discover -s tests'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: "dockerhub", usernameVariable: 'rushabh46', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "rushabh46" --password-stdin
                        docker push rushabh46/flask-app
                    '''
                }
            }
        }
        stage('Deploy Updated Container') {
            steps {
                echo 'Deploying updated container...'
                sh '''
                    docker stop flask-app || true
                    docker rm flask-app || true
                    docker run -d --name flask-app -p 5000:5000 rushabh46/flask-app
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
