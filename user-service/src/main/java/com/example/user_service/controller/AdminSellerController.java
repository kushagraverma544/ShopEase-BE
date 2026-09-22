package com.example.user_service.controller;

import com.example.user_service.dto.HoldSellerRequest;
import com.example.user_service.dto.RejectSellerRequest;
import com.example.user_service.dto.SellerApplicationHistoryEntry;
import com.example.user_service.dto.SellerProfileResponse;
import com.example.user_service.entity.SellerStatus;
import com.example.user_service.service.SellerService;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// "ADMIN" role SecurityConfig mein hi enforce hoti hai (.requestMatchers("/admin/**").hasRole("ADMIN")) —
// yahan dobara check karne ki zaroorat nahi.
@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/sellers")
public class AdminSellerController {

    private final SellerService sellerService;

    @GetMapping
    public List<SellerProfileResponse> getSellers(@RequestParam SellerStatus status) {
        return sellerService.listByStatus(status);
    }

    @PatchMapping("/{id}/approve")
    public SellerProfileResponse approve(@PathVariable Long id) {
        return sellerService.approve(id);
    }

    @PatchMapping("/{id}/reject")
    public SellerProfileResponse reject(@PathVariable Long id, @Valid @RequestBody RejectSellerRequest request) {
        return sellerService.reject(id, request.getReason());
    }

    // Direct dismiss nahi — seller ko remark ke saath correction karke resubmit karne ka mauka
    // milta hai (POST /seller/apply usi application ko update kar deta hai).
    @PatchMapping("/{id}/hold")
    public SellerProfileResponse hold(@PathVariable Long id, @Valid @RequestBody HoldSellerRequest request) {
        return sellerService.hold(id, request.getRemark());
    }

    // Poori journey — review karte waqt pichle hold reasons bhi dikh jaate hain.
    @GetMapping("/{id}/history")
    public List<SellerApplicationHistoryEntry> getHistory(@PathVariable Long id) {
        return sellerService.getHistory(id);
    }
}
