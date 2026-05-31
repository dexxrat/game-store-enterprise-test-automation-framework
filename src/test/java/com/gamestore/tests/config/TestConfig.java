package com.gamestore.tests.config;

import org.aeonbits.owner.ConfigFactory;

public class TestConfig {
    public static final AppConfig CONFIG = ConfigFactory.create(AppConfig.class, System.getProperties());
    public static final String BASE_URL = CONFIG.baseUrl();
    public static final String BASE_PATH = CONFIG.basePath();
    public static final String DB_URL = CONFIG.dbUrl();
    public static final String DB_USER = CONFIG.dbUser();
    public static final String DB_PASSWORD = CONFIG.dbPassword();
}