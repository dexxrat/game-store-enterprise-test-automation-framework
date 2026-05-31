# 🎮 Game Store — Enterprise Test Automation Framework

[![Java](https://img.shields.io/badge/Java-21-blue.svg)](https://adoptium.net/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![JUnit 5](https://img.shields.io/badge/JUnit-5.11.4-green.svg)](https://junit.org/junit5/)
[![REST Assured](https://img.shields.io/badge/REST%20Assured-5.5.0-brightgreen.svg)](https://rest-assured.io/)
[![Docker](https://img.shields.io/badge/Docker-✔-blue.svg)](https://www.docker.com/)

## 📖 О проекте

**Game Store** — это демонстрационный проект, созданный для демонстрации профессионального подхода к автоматизации тестирования микросервисной архитектуры.

## 🛠 Технологический стек

| Категория | Технологии |
|-----------|------------|
| **Backend** | Spring Boot 3.4.4, Spring Security, JWT, JPA |
| **База данных** | PostgreSQL 17.9 |
| **Тестовый фреймворк** | JUnit 5, REST Assured, AssertJ |
| **Генерация данных** | Java Faker |
| **Отчёты** | Allure Framework |
| **Конфигурация** | Owner |
| **Контейнеризация** | Docker, Docker Compose |
| **CI/CD** | Jenkins |

## ✅ Что тестируется

- ✅ Регистрация и аутентификация (JWT)
- ✅ Управление играми (CRUD)
- ✅ Корзина покупок
- ✅ Заказы
- ✅ JSON Schema валидация
- ✅ Performance assertions (response time)

## 🚀 Быстрый старт

```bash
# 1. Клонируй проект
git clone https://github.com/dexxrat/game-store-backend.git
cd game-store-backend

# 2. Запусти Docker (PostgreSQL)
docker-compose up -d

# 3. Запусти тесты
mvn clean test

# 4. Сгенерируй Allure отчёт
mvn allure:serve
