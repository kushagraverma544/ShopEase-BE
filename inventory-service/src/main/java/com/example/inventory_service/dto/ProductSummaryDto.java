package com.example.inventory_service.dto;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// List view ke liye halka DTO — poora product detail (reviews, images, dimensions) yahan nahi chahiye.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductSummaryDto {
    private Long id;
    private String title;
    private BigDecimal price;
    private Integer stock;
    private String category;
    private String thumbnail;
}
