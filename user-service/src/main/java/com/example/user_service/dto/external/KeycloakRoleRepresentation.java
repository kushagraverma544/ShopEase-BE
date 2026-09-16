package com.example.user_service.dto.external;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

// Keycloak Admin API ka role object bohot saare fields deta hai (composite, containerId, attributes,
// etc.) — humein role-mapping assign karne ke liye sirf id + name chahiye, baaki ignore karte hain.
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class KeycloakRoleRepresentation {

    private String id;
    private String name;
}
