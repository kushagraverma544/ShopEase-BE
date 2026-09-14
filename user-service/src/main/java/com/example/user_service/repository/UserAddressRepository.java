package com.example.user_service.repository;

import com.example.user_service.entity.UserAddress;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAddressRepository extends JpaRepository<UserAddress, Long> {
    List<UserAddress> findByUserId(Long userId);
}
