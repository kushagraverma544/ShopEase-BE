package com.example.user_service.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Binds the {@code keycloak.*} properties (base URL, realm, client ids) and derives the
 * OpenID Connect / Admin REST API endpoint URLs used by
 * {@link com.example.user_service.service.KeycloakAuthService} (user login/logout) and
 * {@link com.example.user_service.service.KeycloakAdminService} (server-to-server role
 * management).
 *
 * @param baseUrl          Keycloak server root, e.g. {@code http://localhost:8080}
 * @param realm            realm name, e.g. {@code shopEase}
 * @param clientId         public client id used for the password-grant login flow, e.g.
 *                         {@code shopease-app}
 * @param adminClientId    confidential, service-account client id used for Admin REST API
 *                         calls (client_credentials grant), e.g. {@code shopease-admin-api}
 * @param adminClientSecret secret for {@code adminClientId}
 */
@ConfigurationProperties(prefix = "keycloak")
public record KeycloakProperties(String baseUrl, String realm, String clientId, String adminClientId,
        String adminClientSecret) {

    /**
     * @return the realm's token endpoint — used both for the password-grant login call and for
     *         the admin service account's client_credentials grant
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

    /**
     * @param roleName realm role name, e.g. {@code SELLER}
     * @return the Admin REST API URL for looking up that role's representation (id + name)
     */
    public String adminRoleUrl(String roleName) {
        return baseUrl + "/admin/realms/" + realm + "/roles/" + roleName;
    }

    /**
     * @param keycloakUserId Keycloak's internal user id (the JWT {@code sub} claim)
     * @return the Admin REST API URL for reading/assigning that user's realm role mappings
     */
    public String adminUserRoleMappingsUrl(String keycloakUserId) {
        return baseUrl + "/admin/realms/" + realm + "/users/" + keycloakUserId + "/role-mappings/realm";
    }
}
