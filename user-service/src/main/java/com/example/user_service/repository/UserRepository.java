package com.example.user_service.repository;

import com.example.user_service.entity.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByKeycloakId(String keycloakId);

    Optional<User> findByEmail(String email);
}
