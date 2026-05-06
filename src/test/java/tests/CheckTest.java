package tests;

import models.RegisterRequest;
import org.testng.annotations.Test;
import services.AuthApiService;

public class CheckTest {
    private final AuthApiService authApiService = new AuthApiService();

    @Test(description = "Техническая проверка работоспособности фреймворка")
    public void technicalCheckTest() {
        // Создаем данные
        RegisterRequest request = RegisterRequest.builder()
                .username("testuser")
                .password("password123")
                .email("test@mail.com")
                .build();

        // Пробуем вызвать метод сервиса
        // Если проект собран правильно — этот код не будет подчеркнут красным
        authApiService.register(request);
    }
}