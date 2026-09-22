package com.example.user_service.repository;

import com.example.user_service.entity.SellerProfile;
import com.example.user_service.entity.SellerStatus;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SellerProfileRepository extends JpaRepository<SellerProfile, Long> {

    Optional<SellerProfile> findFirstByUserIdOrderByAppliedAtDesc(Long userId);

    List<SellerProfile> findByStatus(SellerStatus status);
}
