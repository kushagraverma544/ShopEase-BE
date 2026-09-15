package com.example.user_service.controller;

import com.example.user_service.dto.LoginRequest;
import com.example.user_service.dto.LoginResponse;
import com.example.user_service.dto.LogoutRequest;
import com.example.user_service.service.KeycloakAuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Public authentication endpoints — permitted without a token (see
 * {@link com.example.user_service.config.SecurityConfig}).
 *
 * <p>FE seedha Keycloak ko call nahi karta — ye endpoints Keycloak ke token/logout API ko wrap
 * karte hain, taaki FE ko Keycloak ka URL/internals pata na ho, aur kal Keycloak badle toh FE ka
 * contract na toote.
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {

    private final KeycloakAuthService keycloakAuthService;

    /**
     * Logs a user in against Keycloak.
     *
     * @param request username and password
     * @return access token, refresh token and expiry
     */
    @PostMapping("/login")
    public LoginResponse login(@Valid @RequestBody LoginRequest request) {
        return keycloakAuthService.login(request.getUsername(), request.getPassword());
    }

    /**
     * Logs a user out by revoking their refresh token at Keycloak.
     *
     * @param request the refresh token to revoke
     * @return 204 No Content on success
     */
    @PostMapping("/logout")
    public ResponseEntity<Void> logout(@Valid @RequestBody LogoutRequest request) {
        keycloakAuthService.logout(request.getRefreshToken());
        return ResponseEntity.noContent().build();
    }
}
