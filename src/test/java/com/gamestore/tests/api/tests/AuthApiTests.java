package com.gamestore.tests.api.tests;

import com.gamestore.tests.assertions.AssertableResponse;
import com.gamestore.tests.conditions.Conditions;
import com.gamestore.tests.generators.TestDataGenerator;
import com.gamestore.tests.listeners.RetryListener;
import com.gamestore.tests.models.AuthRequest;
import com.gamestore.tests.models.RegisterRequest;
import com.gamestore.tests.services.AuthService;
import io.qameta.allure.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;

@Epic("API Testing")
@Feature("Authentication")
@ExtendWith(RetryListener.class)
public class AuthApiTests {
    private final AuthService authService = new AuthService();

    @Test
    @Severity(SeverityLevel.CRITICAL)
    @DisplayName("Register new user successfully")
    @Description("User should be able to register with valid credentials")
    public void testRegisterSuccess() {
        RegisterRequest request = TestDataGenerator.randomRegisterRequest();

        authService.register(request)
                .should(Conditions.hasStatusCode(200))
                .should(Conditions.bodyFieldEquals("username", request.getUsername()))
                .should(Conditions.bodyFieldEquals("email", request.getEmail()))
                .should(Conditions.hasToken());
    }

    @Test
    @Severity(SeverityLevel.CRITICAL)
    @DisplayName("Login with valid credentials")
    @Description("User should receive JWT token after successful login")
    public void testLoginSuccess() {
        RegisterRequest registerRequest = TestDataGenerator.randomRegisterRequest();
        authService.register(registerRequest);

        AuthRequest loginRequest = AuthRequest.builder()
                .username(registerRequest.getUsername())
                .password(registerRequest.getPassword())
                .build();

        authService.login(loginRequest)
                .should(Conditions.hasStatusCode(200))
                .should(Conditions.hasToken());
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Login with invalid password returns 403")
    @Description("User should not be able to login with wrong password")
    public void testLoginInvalidPassword() {
        RegisterRequest registerRequest = TestDataGenerator.randomRegisterRequest();
        authService.register(registerRequest);

        AuthRequest loginRequest = AuthRequest.builder()
                .username(registerRequest.getUsername())
                .password("wrongpassword")
                .build();

        authService.login(loginRequest)
                .should(Conditions.hasStatusCode(403));
    }

    @Test
    @Severity(SeverityLevel.NORMAL)
    @DisplayName("Register with existing username fails")
    @Description("User cannot register with duplicate username")
    public void testRegisterDuplicateUsername() {
        RegisterRequest request = TestDataGenerator.randomRegisterRequest();
        authService.register(request).should(Conditions.hasStatusCode(200));

        authService.register(request).should(Conditions.hasStatusCode(400));
    }
}