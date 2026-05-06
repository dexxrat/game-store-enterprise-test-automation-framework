pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                // Эта команда говорит Jenkins:
                // "Возьми настройки Git из интерфейса проекта и скачай код"
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                // Запускаем сборку
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