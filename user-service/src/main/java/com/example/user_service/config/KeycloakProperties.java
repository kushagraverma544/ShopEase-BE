package com.example.user_service.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Binds the {@code keycloak.*} properties (base URL, realm, client id) and derives the
 * OpenID Connect endpoint URLs {@link com.example.user_service.service.KeycloakAuthService}
 * calls for login and logout.
 *
 * @param baseUrl  Keycloak server root, e.g. {@code http://localhost:8080}
 * @param realm    realm name, e.g. {@code shopEase}
 * @param clientId public client id registered in that realm, e.g. {@code shopease-app}
 */
@ConfigurationProperties(prefix = "keycloak")
public record KeycloakProperties(String baseUrl, String realm, String clientId) {

    /**
     * @return the realm's token endpoint, used for the password-grant login call
     */
    public String tokenUrl() {
        return baseUrl + "/realms/" + realm + "/protocol/openid-connect/token";
    }

    /**
     * @return the realm's logout endpoint, used to revoke a refresh token
     */
    public String logoutUrl() {
        return baseUrl + "/realms/" + realm + "/protocol/openid-connect/logout";
    }
}
