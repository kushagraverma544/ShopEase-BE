package com.example.user_service.dto;

import com.example.user_service.entity.HistoryActor;
import com.example.user_service.entity.SellerStatus;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerApplicationHistoryEntry {
    private SellerStatus fromStatus;
    private SellerStatus toStatus;
    private String remark;
    private HistoryActor actor;
    private LocalDateTime occurredAt;
}
