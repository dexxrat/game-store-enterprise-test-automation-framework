package tests;

import io.restassured.response.Response;
import models.RegisterRequest;
import org.testng.annotations.Test;
import services.AuthApiService;
import utils.DataGenerator;

import static org.hamcrest.Matchers.equalTo;

public class AuthTests {
    private final AuthApiService authService = new AuthApiService();

    @Test(description = "Успешная регистрация нового пользователя")
    public void successfulRegistrationTest() {
        // Генерируем уникальные данные пользователя через Faker
        RegisterRequest user = DataGenerator.getRandomUser();

        Response response = authService.register(user);

        // Проверяем статус код 200 (или 201, смотря что возвращает твой бэкенд)
        response.then()
                .statusCode(200);
    }
}