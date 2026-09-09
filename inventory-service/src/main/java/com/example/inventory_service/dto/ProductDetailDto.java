package com.example.inventory_service.dto;

import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailDto {
    private Long id;
    private String title;
    private String description;
    private String category;
    private BigDecimal price;
    private BigDecimal discountPercentage;
    private BigDecimal rating;
    private Integer stock;
    private String brand;
    private String thumbnail;
    private List<String> images;
}
