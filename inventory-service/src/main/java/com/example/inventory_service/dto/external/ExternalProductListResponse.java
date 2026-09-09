package com.example.inventory_service.dto.external;

import java.util.List;
import lombok.Data;

// Dummyjson ke /products aur /products/search dono ka response shape same hai.
@Data
public class ExternalProductListResponse {
    private List<ExternalProduct> products;
    private Integer total;
    private Integer skip;
    private Integer limit;
}
