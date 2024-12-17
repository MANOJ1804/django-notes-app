@Library("JenkinsGITShared") _
pipeline {
    agent {label 'JNode'}

    stages {
        stage('Hello') {
            steps {
               script{
                   hello()
               }
            }
        }
        stage('Code Git Pull') {
            steps {
                script{
                    clone("https://github.com/MANOJ1804/django-notes-app.git", "main")
                }
               //git branch: 'main', url: 'https://github.com/MANOJ1804/django-notes-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker image build -t django-notes-app:latest . '
            }
        }
        stage('Test') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Push to Docker Hub') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerCred', passwordVariable: 'dockerCredP', usernameVariable: 'dockerCredU')]) 
                {
                    sh "docker login -u ${env.dockerCredU} -p ${env.dockerCredP}"
                    sh "docker tag django-notes-app:latest ${env.dockerCredU}/django-notes-app:latest"
                    sh "docker push ${env.dockerCredU}/django-notes-app:latest"
                }
            }
        }
        stage('Deploy Docker conatainer') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}
