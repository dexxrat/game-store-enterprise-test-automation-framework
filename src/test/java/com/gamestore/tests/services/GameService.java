package com.gamestore.tests.services;

import com.gamestore.tests.assertions.AssertableResponse;
import com.gamestore.tests.specs.Specs;

import static io.restassured.RestAssured.given;

public class GameService {
    public AssertableResponse getAllGames() {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .when()
                        .get("/games")
                        .then()
        );
    }

    public AssertableResponse getGameById(Long id) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .pathParam("id", id)
                        .when()
                        .get("/games/{id}")
                        .then()
        );
    }

    public AssertableResponse searchGames(String query) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .queryParam("query", query)
                        .when()
                        .get("/games/search")
                        .then()
        );
    }

    public AssertableResponse getGamesByGenre(String genre) {
        return new AssertableResponse(
                given()
                        .spec(Specs.base())
                        .pathParam("genre", genre)
                        .when()
                        .get("/games/genre/{genre}")
                        .then()
        );
    }
}