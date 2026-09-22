package com.example.user_service.repository;

import com.example.user_service.entity.SellerApplicationHistory;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SellerApplicationHistoryRepository extends JpaRepository<SellerApplicationHistory, Long> {
    List<SellerApplicationHistory> findBySellerProfileIdOrderByOccurredAtAsc(Long sellerProfileId);
}
