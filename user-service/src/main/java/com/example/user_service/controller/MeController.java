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

/**
 * Self-service profile and address endpoints for the currently authenticated user.
 *
 * <p>JWT-protected — "@AuthenticationPrincipal Jwt" se hi caller resolve hota hai, userId kabhi
 * bhi request se accept nahi karte (warna koi user dusre ka data edit kar sakta hai).
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/me")
public class MeController {

    private final UserProfileService userProfileService;
    private final UserAddressService userAddressService;

    /**
     * @param jwt the caller's validated token
     * @return the caller's full profile
     */
    @GetMapping
    public MyDetailsResponse getMyDetails(@AuthenticationPrincipal Jwt jwt) {
        return userProfileService.getMyDetails(jwt);
    }

    /**
     * @param jwt     the caller's validated token
     * @param request updated name / date of birth / gender / preferred language
     * @return the caller's profile after the update
     */
    @PatchMapping("/personal-details")
    public MyDetailsResponse updatePersonalDetails(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody PersonalDetailsRequest request) {
        return userProfileService.updatePersonalDetails(jwt, request);
    }

    /**
     * @param jwt     the caller's validated token
     * @param request updated mobile / alternate number
     * @return the caller's profile after the update
     */
    @PatchMapping("/contact-details")
    public MyDetailsResponse updateContactDetails(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody ContactDetailsRequest request) {
        return userProfileService.updateContactDetails(jwt, request);
    }

    /**
     * @param jwt     the caller's validated token
     * @param request updated security preference (e.g. OTP login toggle)
     * @return the caller's profile after the update
     */
    @PatchMapping("/security")
    public MyDetailsResponse updateSecurityPreference(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody SecurityPreferenceRequest request) {
        return userProfileService.updateSecurityPreference(jwt, request);
    }

    /**
     * @param jwt the caller's validated token
     * @return all addresses belonging to the caller
     */
    @GetMapping("/addresses")
    public List<AddressResponse> getAddresses(@AuthenticationPrincipal Jwt jwt) {
        return userAddressService.getAddresses(jwt);
    }

    /**
     * @param jwt     the caller's validated token
     * @param request the address to add
     * @return the created address
     */
    @PostMapping("/addresses")
    public AddressResponse createAddress(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody AddressRequest request) {
        return userAddressService.createAddress(jwt, request);
    }

    /**
     * @param jwt     the caller's validated token
     * @param id      id of the address to update; must belong to the caller
     * @param request the replacement address fields
     * @return the updated address
     */
    @PutMapping("/addresses/{id}")
    public AddressResponse updateAddress(@AuthenticationPrincipal Jwt jwt, @PathVariable Long id,
            @Valid @RequestBody AddressRequest request) {
        return userAddressService.updateAddress(jwt, id, request);
    }

    /**
     * @param jwt the caller's validated token
     * @param id  id of the address to delete; must belong to the caller
     * @return 204 No Content on success
     */
    @DeleteMapping("/addresses/{id}")
    public ResponseEntity<Void> deleteAddress(@AuthenticationPrincipal Jwt jwt, @PathVariable Long id) {
        userAddressService.deleteAddress(jwt, id);
        return ResponseEntity.noContent().build();
    }
}
