package com.example.user_service.controller;

import com.example.user_service.dto.SellerApplicationHistoryEntry;
import com.example.user_service.dto.SellerApplicationStatusResponse;
import com.example.user_service.dto.SellerApplyRequest;
import com.example.user_service.dto.SellerProfileResponse;
import com.example.user_service.service.SellerService;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

// JWT-protected via SecurityConfig ka anyRequest().authenticated() — koi bhi logged-in user
// (abhi CUSTOMER) apply kar sakta hai, seller-hood is application se aata hai, registration se nahi.
@RestController
@RequiredArgsConstructor
@RequestMapping("/seller")
public class SellerController {

    private final SellerService sellerService;

    // multipart/form-data — "data" part poora application JSON hai, files optional hain.
    // NOTE: cancelledCheque/productImage abhi sirf accept hote hain, kahin store nahi hote — koi
    // blob-storage service nahi hai is project mein abhi. Jab storage design hoga, tab wire karenge.
    @PostMapping(value = "/apply", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<SellerApplicationStatusResponse> apply(@AuthenticationPrincipal Jwt jwt,
            @Valid @RequestPart("data") SellerApplyRequest request,
            @RequestPart(value = "cancelledCheque", required = false) MultipartFile cancelledCheque,
            @RequestPart(value = "productImage", required = false) MultipartFile productImage) {
        return ResponseEntity.status(HttpStatus.CREATED).body(sellerService.apply(jwt, request));
    }

    @GetMapping("/application-status")
    public SellerApplicationStatusResponse getApplicationStatus(@AuthenticationPrincipal Jwt jwt) {
        return sellerService.getMyApplicationStatus(jwt);
    }

    // Sirf PENDING ya HOLD application revoke ho sakti hai — SellerService khud check karta hai.
    @DeleteMapping("/apply")
    public SellerProfileResponse revoke(@AuthenticationPrincipal Jwt jwt) {
        return sellerService.revoke(jwt);
    }

    // Seller ka apna business profile — "/me" (customer MyDetailsResponse) se alag, kyunki usme
    // storeName/businessType/PAN/bank/pickup-address jaisi fields hoti hi nahi. Seller-side profile
    // page ko yahi call karna chahiye, "/me" nahi.
    @GetMapping("/profile")
    public SellerProfileResponse getMyProfile(@AuthenticationPrincipal Jwt jwt) {
        return sellerService.getMyProfile(jwt);
    }

    // Poori journey — apply -> hold -> resubmit -> ... -> approve/reject, chronological order mein.
    @GetMapping("/history")
    public List<SellerApplicationHistoryEntry> getMyHistory(@AuthenticationPrincipal Jwt jwt) {
        return sellerService.getMyHistory(jwt);
    }
}
