package com.example.user_service.service;

import com.example.user_service.dto.AddressResponse;
import com.example.user_service.dto.ContactDetailsRequest;
import com.example.user_service.dto.MyDetailsResponse;
import com.example.user_service.dto.PersonalDetailsRequest;
import com.example.user_service.dto.SecurityPreferenceRequest;
import com.example.user_service.entity.User;
import com.example.user_service.repository.UserAddressRepository;
import com.example.user_service.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserProfileService {

    private final UserRepository userRepository;
    private final UserAddressRepository userAddressRepository;

    // JIT (Just-In-Time) provisioning: Keycloak hi signup/login handle karta hai, hum apna "users" row
    // pehli authenticated call pe khud bana lete hain — alag se /register endpoint nahi chahiye.
    @Transactional
    public User resolveCurrentUser(Jwt jwt) {
        String keycloakId = jwt.getSubject();

        return userRepository.findByKeycloakId(keycloakId)
                .orElseGet(() -> linkOrCreate(jwt, keycloakId));
    }

    private User linkOrCreate(Jwt jwt, String keycloakId) {
        String email = jwt.getClaimAsString("email");

        // Purane (Keycloak se pehle bane) users rows ko email match se link kar do, taaki naya duplicate na bane.
        if (email != null) {
            var existing = userRepository.findByEmail(email);
            if (existing.isPresent()) {
                User user = existing.get();
                user.setKeycloakId(keycloakId);
                return userRepository.save(user);
            }
        }

        User user = new User();
        user.setKeycloakId(keycloakId);
        user.setEmail(email);
        String name = jwt.getClaimAsString("name");
        user.setName(name != null ? name : jwt.getClaimAsString("preferred_username"));
        user.setEmailVerified(Boolean.TRUE.equals(jwt.getClaim("email_verified")));
        return userRepository.save(user);
    }

    public MyDetailsResponse getMyDetails(Jwt jwt) {
        User user = resolveCurrentUser(jwt);
        return toMyDetailsResponse(user);
    }

    @Transactional
    public MyDetailsResponse updatePersonalDetails(Jwt jwt, PersonalDetailsRequest request) {
        User user = resolveCurrentUser(jwt);
        user.setName(request.getFullName());
        user.setGender(request.getGender());
        user.setDateOfBirth(request.getDateOfBirth());
        user.setPreferredLanguage(request.getPreferredLanguage());
        userRepository.save(user);
        return toMyDetailsResponse(user);
    }

    @Transactional
    public MyDetailsResponse updateContactDetails(Jwt jwt, ContactDetailsRequest request) {
        User user = resolveCurrentUser(jwt);
        user.setMobileNumber(request.getMobileNumber());
        user.setAlternateNumber(request.getAlternateNumber());
        userRepository.save(user);
        return toMyDetailsResponse(user);
    }

    @Transactional
    public MyDetailsResponse updateSecurityPreference(Jwt jwt, SecurityPreferenceRequest request) {
        User user = resolveCurrentUser(jwt);
        user.setOtpLoginEnabled(request.isOtpLoginEnabled());
        userRepository.save(user);
        return toMyDetailsResponse(user);
    }

    private MyDetailsResponse toMyDetailsResponse(User user) {
        var addresses = userAddressRepository.findByUserId(user.getId()).stream()
                .map(address -> new AddressResponse(
                        address.getId(), address.getType(), address.getRecipientName(), address.getPhone(),
                        address.getAddressLine1(), address.getAddressLine2(), address.getCity(),
                        address.getState(), address.getPincode(), address.isDefaultAddress()))
                .toList();

        return new MyDetailsResponse(user.getId(), user.getName(), user.getEmail(), user.isEmailVerified(),
                user.getGender(), user.getDateOfBirth(), user.getPreferredLanguage(), user.getMobileNumber(),
                user.getAlternateNumber(), user.isMobileVerified(), user.isOtpLoginEnabled(), addresses);
    }
}
