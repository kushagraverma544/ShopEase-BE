package com.example.user_service.service;

import com.example.user_service.config.KeycloakProperties;
import com.example.user_service.dto.external.KeycloakRoleRepresentation;
import com.example.user_service.dto.external.KeycloakTokenResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

/**
 * Server-to-server client for Keycloak's Admin REST API, authenticating as the
 * {@code shopease-admin-api} service account (client_credentials grant) — never a user's own
 * token.
 *
 * <p>Called when an admin approves a seller application, to grant that user the {@code SELLER}
 * realm role without requiring them to re-authenticate through a privileged account.
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class KeycloakAdminService {

    private final KeycloakProperties keycloakProperties;
    private final RestClient restClient = RestClient.create();

    /**
     * Grants a realm role to a user.
     *
     * @param keycloakUserId Keycloak's internal user id (the JWT {@code sub} claim) — not the
     *                       local {@code users.id}
     * @param roleName       realm role name, e.g. {@code SELLER}
     * @throws IllegalStateException if the admin service account can't authenticate, the role
     *         doesn't exist, or Keycloak rejects the assignment — caught by
     *         {@link com.example.user_service.exception.GlobalExceptionHandler}'s generic
     *         handler and returned to the caller as a 500, with the real cause logged here
     */
    public void assignRealmRole(String keycloakUserId, String roleName) {
        String adminToken = fetchAdminAccessToken();
        KeycloakRoleRepresentation role = fetchRealmRole(adminToken, roleName);
        assignRole(adminToken, keycloakUserId, role);
    }

    // client_credentials grant — koi user credential involved nahi hai, sirf service account
    // (KEYCLOAK_ADMIN_CLIENT_ID/SECRET) khud authenticate hota hai.
    private String fetchAdminAccessToken() {
        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("grant_type", "client_credentials");
        form.add("client_id", keycloakProperties.adminClientId());
        form.add("client_secret", keycloakProperties.adminClientSecret());

        try {
            KeycloakTokenResponse response = restClient.post()
                    .uri(keycloakProperties.tokenUrl())
                    .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .body(form)
                    .retrieve()
                    .body(KeycloakTokenResponse.class);
            return response.getAccessToken();
        } catch (RestClientException e) {
            log.error("Keycloak admin service account authentication failed", e);
            throw new IllegalStateException("Could not authenticate the Keycloak admin service account", e);
        }
    }

    // Role-mapping assign karne ke liye Keycloak ko role ka naam nahi, uska internal "id" chahiye —
    // isliye pehle role ko naam se lookup karna padta hai.
    private KeycloakRoleRepresentation fetchRealmRole(String adminToken, String roleName) {
        try {
            return restClient.get()
                    .uri(keycloakProperties.adminRoleUrl(roleName))
                    .headers(headers -> headers.setBearerAuth(adminToken))
                    .retrieve()
                    .body(KeycloakRoleRepresentation.class);
        } catch (RestClientException e) {
            log.error("Realm role '{}' lookup failed", roleName, e);
            throw new IllegalStateException("Realm role not found in Keycloak: " + roleName, e);
        }
    }

    private void assignRole(String adminToken, String keycloakUserId, KeycloakRoleRepresentation role) {
        try {
            restClient.post()
                    .uri(keycloakProperties.adminUserRoleMappingsUrl(keycloakUserId))
                    .headers(headers -> headers.setBearerAuth(adminToken))
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(List.of(role))
                    .retrieve()
                    .toBodilessEntity();
        } catch (RestClientException e) {
            log.error("Assigning role '{}' to Keycloak user '{}' failed", role.getName(), keycloakUserId, e);
            throw new IllegalStateException("Could not assign role " + role.getName() + " in Keycloak", e);
        }
    }
}
