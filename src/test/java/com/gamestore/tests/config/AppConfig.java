package com.gamestore.tests.config;

import org.aeonbits.owner.Config;

@Config.Sources({"classpath:config.properties"})
public interface AppConfig extends Config {
    @Key("base.url")
    String baseUrl();

    @Key("base.path")
    String basePath();

    @Key("db.url")
    String dbUrl();

    @Key("db.user")
    String dbUser();

    @Key("db.password")
    String dbPassword();
}