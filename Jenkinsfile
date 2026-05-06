pipeline {
    agent any

    tools {
        // Убедись, что в Manage Jenkins -> Tools имя Maven именно 'MAVEN_HOME'
        maven 'MAVEN_HOME'
    }

    options {
        // Ограничиваем время выполнения, чтобы билд не завис навечно
        timeout(time: 15, unit: 'MINUTES')
        // Оставляем только 10 последних сборок, чтобы не забивать память
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                // Прямое скачивание кода
                git branch: 'main', url: 'https://github.com/dexxrat/CourseBackeEnd.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Preparing and building the application...'
                // Исправляем права доступа для Linux окружения Jenkins
                sh 'chmod +x mvnw'
                // Собираем проект без тестов
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('API Tests') {
            steps {
                echo 'Running API Automation Tests...'
                // Ключевой флаг AQA: ignore=true позволяет сформировать отчет даже при падениях
                sh './mvnw test -Dmaven.test.failure.ignore=true'
            }
        }
    }

    post {
        always {
            echo 'Generating Allure Report...'
            script {
                // Генерация отчета Allure из папки результатов
                allure includeProperties: false,
                       jdk: '',
                       results: [[path: 'target/allure-results']]
            }
        }

        unstable {
            echo '⚠️ Сборка завершена со статусом UNSTABLE: есть упавшие тесты.'
        }

        failure {
            echo '❌ Сборка завершена со статусом FAILURE: критическая ошибка в коде или инфраструктуре.'
        }

        cleanup {
            echo 'Cleaning up workspace...'
            // Хорошая практика — чистить за собой тяжелые файлы
            deleteDir()
        }
    }
}