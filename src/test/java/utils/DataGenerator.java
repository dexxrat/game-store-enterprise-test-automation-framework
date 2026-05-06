package utils;

import com.github.javafaker.Faker;
import models.RegisterRequest;

public class DataGenerator {
    private static final Faker faker = new Faker();

    public static RegisterRequest getRandomUser() {
        String username = faker.name().username();
        return RegisterRequest.builder()
                .username(username)
                .password(faker.internet().password())
                .email(username + "@example.com")
                .build();
    }
}