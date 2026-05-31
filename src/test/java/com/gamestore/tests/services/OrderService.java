package com.gamestore.tests.services;

import com.gamestore.tests.assertions.AssertableResponse;
import com.gamestore.tests.specs.Specs;

import static io.restassured.RestAssured.given;

public class OrderService {
    public AssertableResponse createOrder(String token) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .when()
                        .post("/orders")
                        .then()
        );
    }

    public AssertableResponse getUserOrders(String token) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .when()
                        .get("/orders")
                        .then()
        );
    }

    public AssertableResponse getOrderById(String token, Long orderId) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .pathParam("orderId", orderId)
                        .when()
                        .get("/orders/{orderId}")
                        .then()
        );
    }
}