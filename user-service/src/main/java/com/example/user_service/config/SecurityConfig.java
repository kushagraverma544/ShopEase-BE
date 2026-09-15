package com.example.user_service.config;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;

/**
 * Stateless JWT resource-server configuration for user-service.
 *
 * <p>Tokens are issued by Keycloak (realm {@code shopEase}) and validated here against the
 * issuer's JWK set — this service never talks to Keycloak on the request path, only at
 * login/logout time via {@link com.example.user_service.service.KeycloakAuthService}.
 */
@Configuration
public class SecurityConfig {

    /**
     * Defines which endpoints require a valid bearer token and wires the custom
     * {@link #jwtAuthenticationConverter()} so realm roles are available as Spring authorities.
     *
     * @param http the HTTP security builder
     * @return the built filter chain
     * @throws Exception propagated from {@link HttpSecurity#build()}
     */
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)   // stateless bearer-token API, session cookies nahi hain
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/auth/**", "/actuator/**").permitAll()
                        // NOTE: /users/** abhi khula hai kyunki order-service ka Feign client (UserClient)
                        // inhe bina JWT ke internally call karta hai — protect karne se woh integration
                        // toot jaayegi. Ye ek known gap hai (aage service-to-service auth chahiye hoga).
                        .requestMatchers("/users/**").permitAll()
                        .anyRequest().authenticated())
                .oauth2ResourceServer(oauth2 -> oauth2.jwt(jwt -> jwt.jwtAuthenticationConverter(jwtAuthenticationConverter())));
        return http.build();
    }

    /**
     * Builds a converter that maps Keycloak realm roles onto Spring authorities, in place of
     * Spring's default converter which only reads the {@code scope}/{@code scp} claim.
     *
     * @return a {@link JwtAuthenticationConverter} backed by {@link #extractRealmRoles(Jwt)}
     */
    // Keycloak realm roles JWT ke "realm_access.roles" claim mein aate hain — Spring ka default
    // JwtGrantedAuthoritiesConverter sirf "scope"/"scp" padhta hai, isliye khud map karna padta hai.
    // "ROLE_" prefix zaroori hai kyunki hasRole("ADMIN") internally "ROLE_ADMIN" authority dhundta hai.
    private JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtAuthenticationConverter converter = new JwtAuthenticationConverter();
        converter.setJwtGrantedAuthoritiesConverter(this::extractRealmRoles);
        return converter;
    }

    /**
     * Reads the {@code realm_access.roles} claim and converts each role into a
     * {@code ROLE_<name>} authority (e.g. {@code ADMIN} → {@code ROLE_ADMIN}).
     *
     * @param jwt the validated token for the current request
     * @return the granted authorities derived from realm roles, or an empty list if the claim
     *         is absent
     */
    private Collection<GrantedAuthority> extractRealmRoles(Jwt jwt) {
        Map<String, Object> realmAccess = jwt.getClaim("realm_access");
        if (realmAccess == null || !(realmAccess.get("roles") instanceof List<?> roles)) {
            return List.of();
        }
        return roles.stream()
                .map(role -> new SimpleGrantedAuthority("ROLE_" + role))
                .collect(Collectors.toList());
    }
}
