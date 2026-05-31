package com.gamestore.tests.api.tests;

import com.gamestore.tests.conditions.Conditions;
import com.gamestore.tests.generators.TestDataGenerator;
import com.gamestore.tests.models.AuthRequest;
import com.gamestore.tests.models.CartItemDTO;
import com.gamestore.tests.models.RegisterRequest;
import com.gamestore.tests.services.AuthService;
import com.gamestore.tests.services.CartService;
import io.qameta.allure.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

@Epic("API Testing")
@Feature("Cart Management")
public class CartApiTests {
    private final AuthService authService = new AuthService();
    private final CartService cartService = new CartService();
    private String token;

    @BeforeEach
    public void setup() {
        RegisterRequest registerRequest = TestDataGenerator.randomRegisterRequest();
        authService.register(registerRequest).should(Conditions.hasStatusCode(200));

        AuthRequest loginRequest = AuthRequest.builder()
                .username(registerRequest.getUsername())
                .password(registerRequest.getPassword())
                .build();

        token = authService.login(loginRequest).asJwt();

        cartService.getCart(token).should(Conditions.hasStatusCode(200));
    }

    @Test
    @Severity(SeverityLevel.CRITICAL)
    @DisplayName("Get user cart")
    @Description("Should return cart for authenticated user")
    public void testGetCart() {
        cartService.getCart(token)
                .should(Conditions.hasStatusCode(200));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Add item to cart")
    @Description("Should add game to user cart")
    public void testAddToCart() {
        CartItemDTO item = CartItemDTO.builder()
                .gameId(86L)
                .quantity(1)
                .price(BigDecimal.valueOf(19.99))
                .build();

        cartService.addToCart(token, item)
                .should(Conditions.hasStatusCode(200));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Clear cart")
    @Description("Should remove all items from user cart")
    public void testClearCart() {
        cartService.clearCart(token)
                .should(Conditions.hasStatusCode(200));
    }
}