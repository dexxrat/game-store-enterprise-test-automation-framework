pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                // Вместо checkout scm используем прямую ссылку на твой гит
                git branch: 'main', url: 'https://github.com/dexxrat/CourseBackeEnd.git'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('API Tests') {
            steps {
                // Игнорируем падения тестов, чтобы получить отчет и желтый статус
                sh './mvnw test -Dmaven.test.failure.ignore=true'
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
        unstable {
            echo 'Тесты не прошли, но отчет готов.'
        }
    }
}