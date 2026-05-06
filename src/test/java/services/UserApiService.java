package services;

import io.qameta.allure.Step;
import io.restassured.response.Response;
import models.AuthRequest;     // Импортируем правильные классы
import models.RegisterRequest; // Импортируем правильные классы
import specs.Specs;

import static io.restassured.RestAssured.given;

public class UserApiService {

    @Step("Регистрация нового пользователя")
    public Response registerUser(RegisterRequest user) { // Исправлено имя класса
        return given()
                .spec(Specs.requestSpec)
                .body(user)
                .when()
                .post("/auth/register");
    }

    @Step("Авторизация пользователя")
    public Response loginUser(AuthRequest authData) { // У логина обычно другой DTO
        return given()
                .spec(Specs.requestSpec)
                .body(authData)
                .when()
                .post("/auth/login");
    }
}