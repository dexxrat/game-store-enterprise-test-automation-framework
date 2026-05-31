package com.gamestore.tests.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GameDTO {
    private Long id;
    private String title;
    private String description;
    private String developer;
    private String publisher;
    private LocalDate releaseDate;
    private String platform;
    private Set<String> genres;
    private BigDecimal price;
    private BigDecimal discountPrice;
    private String imageUrl;
}