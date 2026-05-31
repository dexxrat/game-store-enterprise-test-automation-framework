package com.gamestore.tests.services;

import com.gamestore.tests.assertions.AssertableResponse;
import com.gamestore.tests.models.CartItemDTO;
import com.gamestore.tests.specs.Specs;

import static io.restassured.RestAssured.given;

public class CartService {
    public AssertableResponse getCart(String token) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .when()
                        .get("/cart")
                        .then()
        );
    }

    public AssertableResponse addToCart(String token, CartItemDTO item) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .body(item)
                        .when()
                        .post("/cart/items")
                        .then()
        );
    }

    public AssertableResponse updateCartItem(String token, Long itemId, Integer quantity) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .pathParam("itemId", itemId)
                        .body("{\"quantity\": " + quantity + "}")
                        .when()
                        .put("/cart/items/{itemId}")
                        .then()
        );
    }

    public AssertableResponse removeFromCart(String token, Long itemId) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .pathParam("itemId", itemId)
                        .when()
                        .delete("/cart/items/{itemId}")
                        .then()
        );
    }

    public AssertableResponse clearCart(String token) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .header("Authorization", "Bearer " + token)
                        .when()
                        .delete("/cart")
                        .then()
        );
    }
}