package com.example.user_service.entity;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// Ek user multiple baar apply kar sakta hai time ke saath (reject ho jaaye toh re-apply) — isliye
// "user_id" unique nahi hai, latest application "applied_at DESC" se resolve hoti hai.
@Entity
@Table(name = "seller_profiles")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SellerProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "store_name", nullable = false, length = 150)
    private String storeName;

    @Column(name = "business_name", nullable = false, length = 150)
    private String businessName;

    @Enumerated(EnumType.STRING)
    @Column(name = "business_type", nullable = false, length = 30)
    private BusinessType businessType;

    @Column(name = "business_email", nullable = false, length = 150)
    private String businessEmail;

    @Column(name = "business_phone", nullable = false, length = 20)
    private String businessPhone;

    @Column(name = "sells_only_books", nullable = false)
    private boolean sellsOnlyBooks;

    @Column(name = "registration_number", length = 50)
    private String registrationNumber;

    @Column(name = "pan_number", nullable = false, length = 20)
    private String panNumber;

    @Column(name = "bank_account_holder_name", nullable = false, length = 150)
    private String bankAccountHolderName;

    @Column(name = "bank_account_number", nullable = false, length = 30)
    private String bankAccountNumber;

    @Column(name = "ifsc_code", nullable = false, length = 15)
    private String ifscCode;

    @Column(name = "pickup_address_line1", nullable = false)
    private String pickupAddressLine1;

    @Column(name = "pickup_address_line2")
    private String pickupAddressLine2;

    @Column(name = "pickup_city", nullable = false, length = 100)
    private String pickupCity;

    @Column(name = "pickup_state", nullable = false, length = 100)
    private String pickupState;

    @Column(name = "pickup_pincode", nullable = false, length = 10)
    private String pickupPincode;

    // Enforcement abhi nahi hai — sirf store ho raha hai, seller apne products kisi bhi category
    // mein daal sakta hai (jaanbujh kar deferred decision).
    @ElementCollection
    @CollectionTable(name = "seller_profile_categories", joinColumns = @JoinColumn(name = "seller_profile_id"))
    @Column(name = "category")
    private List<String> categories;

    // inventory-service mein bane initial product ka id — apply() ke andar hi set hota hai.
    @Column(name = "product_id")
    private Long productId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private SellerStatus status;

    // REJECT aur HOLD dono ka remark yahi field carry karta hai — dono "admin ne application pe kya
    // kaha" hi hain, bas ek terminal hai ek nahi.
    @Column(name = "admin_remark", length = 500)
    private String adminRemark;

    @Column(name = "applied_at", nullable = false)
    private LocalDateTime appliedAt;

    @Column(name = "reviewed_at")
    private LocalDateTime reviewedAt;

    // HOLD ke baad seller ne corrected data resubmit kiya — admin list mein "already corrected"
    // signal karne ke liye.
    @Column(name = "correction_submitted_at")
    private LocalDateTime correctionSubmittedAt;
}
