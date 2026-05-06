pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Только сборка .jar файла без прогона тестов
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('API Tests') {
            steps {
                // -Dmaven.test.failure.ignore=true — КЛЮЧЕВОЙ МОМЕНТ.
                // Позволяет пайплайну не падать с "exit code 1", если тесты не прошли.
                sh './mvnw test -Dmaven.test.failure.ignore=true'
            }
        }
    }

    post {
        always {
            script {
                // Генерация отчета Allure
                allure includeProperties: false,
                       jdk: '',
                       results: [[path: 'target/allure-results']]
            }
        }

        // Эта секция делает пайплайн ЖЕЛТЫМ, если тесты упали, но работа продолжилась
        unstable {
            echo 'Тесты упали, но отчет сформирован. Проверьте Allure!'
        }
    }
}