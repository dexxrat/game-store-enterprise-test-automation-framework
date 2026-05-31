package com.gamestore.tests.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartItemDTO {
    private Long id;
    private Long gameId;
    private String gameTitle;
    private Integer quantity;
    private BigDecimal price;
    private BigDecimal subtotal;
}