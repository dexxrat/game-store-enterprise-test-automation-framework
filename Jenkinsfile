pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                // ОБЯЗАТЕЛЬНО: скачиваем файлы проекта из репозитория
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                // Теперь, когда файлы скачаны, Maven найдет pom.xml
                sh 'mvn clean test'
            }
        }
    }

    post {
        always {
            script {
                allure includeProperties: false,
                       jdk: '',
                       results: [[path: 'target/allure-results']]
            }
        }
    }
}