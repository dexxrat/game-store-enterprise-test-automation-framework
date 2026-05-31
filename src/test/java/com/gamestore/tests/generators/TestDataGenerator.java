package com.gamestore.tests.generators;

import com.gamestore.tests.models.RegisterRequest;
import com.github.javafaker.Faker;

public class TestDataGenerator {
    private static final Faker faker = new Faker();

    public static RegisterRequest randomRegisterRequest() {
        String username = faker.name().username().toLowerCase() + System.currentTimeMillis();
        return RegisterRequest.builder()
                .username(username)
                .email(username + "@example.com")
                .password("Test123!")
                .build();
    }

    public static String randomUsername() {
        return faker.name().username().toLowerCase() + System.currentTimeMillis();
    }

    public static String randomEmail() {
        return faker.internet().emailAddress();
    }

    public static String randomPassword() {
        return faker.internet().password(6, 12, true, true, true);
    }
}