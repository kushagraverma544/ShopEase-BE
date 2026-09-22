package com.example.user_service.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerApplicationStatusResponse {
    private SellerApplicationStatus status;
    private String storeName;
    private String adminRemark;
    private LocalDateTime appliedAt;
    private LocalDateTime reviewedAt;
}
