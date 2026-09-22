package com.example.user_service.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// SellerProfile sirf current state rakhta hai (HOLD->resubmit pe same row overwrite hoti hai) —
// poori journey (kitni baar hold hua, kis reason se, kab resubmit hua) sirf yahan preserve hoti hai.
@Entity
@Table(name = "seller_application_history")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SellerApplicationHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "seller_profile_id", nullable = false)
    private Long sellerProfileId;

    @Enumerated(EnumType.STRING)
    @Column(name = "from_status", length = 20)
    private SellerStatus fromStatus;

    @Enumerated(EnumType.STRING)
    @Column(name = "to_status", nullable = false, length = 20)
    private SellerStatus toStatus;

    @Column(length = 500)
    private String remark;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 10)
    private HistoryActor actor;

    @Column(name = "occurred_at", nullable = false)
    private LocalDateTime occurredAt;
}
