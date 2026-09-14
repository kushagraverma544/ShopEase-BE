package com.example.user_service.controller;

import com.example.user_service.dto.AddressRequest;
import com.example.user_service.dto.AddressResponse;
import com.example.user_service.dto.ContactDetailsRequest;
import com.example.user_service.dto.MyDetailsResponse;
import com.example.user_service.dto.PersonalDetailsRequest;
import com.example.user_service.dto.SecurityPreferenceRequest;
import com.example.user_service.service.UserAddressService;
import com.example.user_service.service.UserProfileService;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// JWT-protected — "@AuthenticationPrincipal Jwt" se hi caller resolve hota hai, userId kabhi bhi
// request se accept nahi karte (warna koi user dusre ka data edit kar sakta hai).
@RestController
@RequiredArgsConstructor
@RequestMapping("/me")
public class MeController {

    private final UserProfileService userProfileService;
    private final UserAddressService userAddressService;

    @GetMapping
    public MyDetailsResponse getMyDetails(@AuthenticationPrincipal Jwt jwt) {
        return userProfileService.getMyDetails(jwt);
    }

    @PatchMapping("/personal-details")
    public MyDetailsResponse updatePersonalDetails(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody PersonalDetailsRequest request) {
        return userProfileService.updatePersonalDetails(jwt, request);
    }

    @PatchMapping("/contact-details")
    public MyDetailsResponse updateContactDetails(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody ContactDetailsRequest request) {
        return userProfileService.updateContactDetails(jwt, request);
    }

    @PatchMapping("/security")
    public MyDetailsResponse updateSecurityPreference(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody SecurityPreferenceRequest request) {
        return userProfileService.updateSecurityPreference(jwt, request);
    }

    @GetMapping("/addresses")
    public List<AddressResponse> getAddresses(@AuthenticationPrincipal Jwt jwt) {
        return userAddressService.getAddresses(jwt);
    }

    @PostMapping("/addresses")
    public AddressResponse createAddress(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody AddressRequest request) {
        return userAddressService.createAddress(jwt, request);
    }

    @PutMapping("/addresses/{id}")
    public AddressResponse updateAddress(@AuthenticationPrincipal Jwt jwt, @PathVariable Long id,
            @Valid @RequestBody AddressRequest request) {
        return userAddressService.updateAddress(jwt, id, request);
    }

    @DeleteMapping("/addresses/{id}")
    public ResponseEntity<Void> deleteAddress(@AuthenticationPrincipal Jwt jwt, @PathVariable Long id) {
        userAddressService.deleteAddress(jwt, id);
        return ResponseEntity.noContent().build();
    }
}
