package com.gamestore.tests.conditions;

public class Conditions {
    public static StatusCodeCondition hasStatusCode(int code) {
        return new StatusCodeCondition(code);
    }

    public static BodyFieldCondition bodyFieldEquals(String jsonPath, Object expected) {
        return new BodyFieldCondition(jsonPath, expected);
    }

    public static BodyFieldCondition hasToken() {
        return new BodyFieldCondition("token", null);
    }
}