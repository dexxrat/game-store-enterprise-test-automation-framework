package specs;

import io.qameta.allure.restassured.AllureRestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;

public class Specs {
    public static RequestSpecification requestSpec = new RequestSpecBuilder()
            .setBaseUri("http://localhost:8080")
            .setBasePath("/api") // База, к которой будут цепляться эндпоинты
            .addFilter(new AllureRestAssured()) // Чтобы запросы попадали в отчет Allure
            .setContentType(ContentType.JSON)
            .log(LogDetail.ALL) // Печатает всё в консоль для отладки
            .build();
}