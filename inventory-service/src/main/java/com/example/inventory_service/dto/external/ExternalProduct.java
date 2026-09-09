package com.example.inventory_service.dto.external;

import java.math.BigDecimal;
import java.util.List;
import lombok.Data;

// Dummyjson product ke poore response me bahut saare fields hain (reviews, meta, dimensions, etc.) —
// hume sirf inhi ki zaroorat hai, baaki Jackson khud ignore kar dega (Spring Boot ka default ObjectMapper
// unknown JSON fields pe fail nahi karta).
@Data
public class ExternalProduct {
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
