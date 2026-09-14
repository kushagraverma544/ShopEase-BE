package com.example.user_service.dto.external;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

// Keycloak ke token endpoint ka raw response — snake_case JSON keys, isliye @JsonProperty zaroori hai.
@Data
public class KeycloakTokenResponse {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("refresh_token")
    private String refreshToken;

    @JsonProperty("expires_in")
    private Long expiresIn;

    @JsonProperty("token_type")
    private String tokenType;
}
