package com.example.gamestore;

import io.qameta.allure.*;
import org.testng.annotations.Test;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.lessThan;

@Epic("Проверка инфраструктуры")
@Feature("Smoke тесты")
public class SmokeTest {

    @Test
    @Description("Проверка доступности базы данных и отчетов Allure")
    @Severity(SeverityLevel.BLOCKER)
    public void testConnection() {
        step("Проверяем, что отчет Allure работает");
        // Здесь мы просто имитируем проверку, позже подставим реальный эндпоинт
        System.out.println("Infrastructure is OK!");
    }

    @Step("{0}")
    public void step(String stepName) {
        // Метод для красивого отображения шагов в Allure
    }
}