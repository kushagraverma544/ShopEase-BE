package com.example.user_service.service;

import com.example.user_service.config.KeycloakProperties;
import com.example.user_service.dto.LoginResponse;
import com.example.user_service.dto.external.KeycloakTokenResponse;
import com.example.user_service.exception.UnauthorizedException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClient;

@Service
@RequiredArgsConstructor
public class KeycloakAuthService {

    private final KeycloakProperties keycloakProperties;
    private final RestClient restClient = RestClient.create();

    public LoginResponse login(String username, String password) {
        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("client_id", keycloakProperties.clientId());
        form.add("grant_type", "password");
        form.add("username", username);
        form.add("password", password);

        try {
            KeycloakTokenResponse response = restClient.post()
                    .uri(keycloakProperties.tokenUrl())
                    .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .body(form)
                    .retrieve()
                    .body(KeycloakTokenResponse.class);

            return new LoginResponse(response.getAccessToken(), response.getRefreshToken(),
                    response.getExpiresIn(), response.getTokenType());
        } catch (HttpClientErrorException e) {
            // Keycloak galat username/password pe 400/401 deta hai — client ko generic "unavailable"
            // 500 nahi, saaf 401 dena hai.
            throw new UnauthorizedException("auth.invalid.credentials");
        }
    }

    public void logout(String refreshToken) {
        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("client_id", keycloakProperties.clientId());
        form.add("refresh_token", refreshToken);

        try {
            restClient.post()
                    .uri(keycloakProperties.logoutUrl())
                    .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .body(form)
                    .retrieve()
                    .toBodilessEntity();
        } catch (HttpClientErrorException e) {
            throw new UnauthorizedException("auth.invalid.token");
        }
    }
}
