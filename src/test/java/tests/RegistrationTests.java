package tests;

import io.restassured.response.Response;
import org.testng.annotations.Test;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import static io.restassured.RestAssured.given;
import io.restassured.http.ContentType;

public class RegistrationTests {

    @Test
    public void successRegistrationTest() {
        // Создаем уникальный суффикс, чтобы данные всегда были новыми
        String uniqueId = UUID.randomUUID().toString().substring(0, 5);

        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("username", "user_" + uniqueId);
        requestBody.put("password", "SecurePass123!");
        requestBody.put("email", "test_" + uniqueId + "@example.com");

        given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .when()
                .post("http://localhost:8080/api/auth/register")
                .then()
                .log().ifError() // Если будет ошибка, мы увидим причину в консоли
                .statusCode(200);
    }
}