package com.example.inventory_service.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// FE ko hamesha yahi consistent paginated shape milega — external provider (dummyjson) badal bhi jaye
// toh FE ka contract nahi tootega.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductListResponse {
    private List<ProductSummaryDto> content;
    private int limit;
    private int offset;
    private long totalElements;
    private int totalPages;
}
