package com.gamestore.tests.conditions;

import io.restassured.response.ValidatableResponse;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.Assertions;

@RequiredArgsConstructor
public class BodyFieldCondition implements Condition {
    private final String jsonPath;
    private final Object expectedValue;

    @Override
    public void check(ValidatableResponse response) {
        Object actual = response.extract().jsonPath().get(jsonPath);
        Assertions.assertEquals(expectedValue, actual,
                String.format("Expected field '%s' to be '%s' but got '%s'", jsonPath, expectedValue, actual));
    }
}