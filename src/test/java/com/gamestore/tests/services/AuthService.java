package com.gamestore.tests.services;

import com.gamestore.tests.assertions.AssertableResponse;
import com.gamestore.tests.models.AuthRequest;
import com.gamestore.tests.models.RegisterRequest;
import com.gamestore.tests.specs.Specs;

import static io.restassured.RestAssured.given;

public class AuthService {
    public AssertableResponse register(RegisterRequest request) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .body(request)
                        .when()
                        .post("/auth/register")
                        .then()
        );
    }

    public AssertableResponse login(AuthRequest request) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .body(request)
                        .when()
                        .post("/auth/login")
                        .then()
        );
    }

    public AssertableResponse getProfile(String token) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .when()
                        .get("/user")
                        .then()
        );
    }
}