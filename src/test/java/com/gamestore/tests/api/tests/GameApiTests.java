package com.gamestore.tests.api.tests;

import com.gamestore.tests.conditions.Conditions;
import com.gamestore.tests.services.GameService;
import io.qameta.allure.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

@Epic("API Testing")
@Feature("Game Management")
public class GameApiTests {
    private final GameService gameService = new GameService();

    @Test
    @Severity(SeverityLevel.CRITICAL)
    @DisplayName("Get all active games")
    @Description("Should return list of all active games")
    public void testGetAllGames() {
        gameService.getAllGames()
                .should(Conditions.hasStatusCode(200));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Get game by valid ID")
    @Description("Should return game details for existing ID")
    public void testGetGameById() {
        gameService.getGameById(86L)
                .should(Conditions.hasStatusCode(200))
                .should(Conditions.bodyFieldEquals("id", 86));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Get game by invalid ID returns 404")
    @Description("Should return 404 for non-existent game ID")
    public void testGetGameByInvalidId() {
        gameService.getGameById(99999L)
                .should(Conditions.hasStatusCode(404));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Search games by keyword")
    @Description("Should return games matching search query")
    public void testSearchGames() {
        gameService.searchGames("Cyberpunk")
                .should(Conditions.hasStatusCode(200));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Get games by genre")
    @Description("Should return games filtered by genre")
    public void testGetGamesByGenre() {
        gameService.getGamesByGenre("ACTION")
                .should(Conditions.hasStatusCode(200));
    }
}