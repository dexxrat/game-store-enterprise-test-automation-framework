package services;

import io.restassured.response.Response;
import models.RegisterRequest;
import specs.Specs;
import static io.restassured.RestAssured.given;

public class AuthApiService {

    public Response register(RegisterRequest request) {
        return given()
                .spec(Specs.requestSpec)
                .body(request)
                .when()
                .post("/auth/register") // Итоговый URL будет: baseUri + basePath + "/auth/register"
                .then()
                .log().all()
                .extract().response();
    }
}