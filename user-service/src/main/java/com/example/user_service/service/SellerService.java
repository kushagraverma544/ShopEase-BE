package com.example.user_service.service;

import com.example.user_service.client.InventoryClient;
import com.example.user_service.dto.InitialProductRequest;
import com.example.user_service.dto.SellerApplicationHistoryEntry;
import com.example.user_service.dto.SellerApplicationStatus;
import com.example.user_service.dto.SellerApplicationStatusResponse;
import com.example.user_service.dto.SellerApplyRequest;
import com.example.user_service.dto.SellerProfileResponse;
import com.example.user_service.dto.external.InventoryCreateProductRequest;
import com.example.user_service.dto.external.InventoryProductResponse;
import com.example.user_service.entity.HistoryActor;
import com.example.user_service.entity.SellerApplicationHistory;
import com.example.user_service.entity.SellerProfile;
import com.example.user_service.entity.SellerStatus;
import com.example.user_service.entity.User;
import com.example.user_service.exception.ConflictException;
import com.example.user_service.exception.ResourceNotFoundException;
import com.example.user_service.repository.SellerApplicationHistoryRepository;
import com.example.user_service.repository.SellerProfileRepository;
import com.example.user_service.repository.UserRepository;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SellerService {

    private static final String SELLER_ROLE = "SELLER";

    private final SellerProfileRepository sellerProfileRepository;
    private final SellerApplicationHistoryRepository sellerApplicationHistoryRepository;
    private final UserRepository userRepository;
    private final UserProfileService userProfileService;
    private final InventoryClient inventoryClient;
    private final KeycloakAdminService keycloakAdminService;

    @Transactional
    public SellerApplicationStatusResponse apply(Jwt jwt, SellerApplyRequest request) {
        User user = userProfileService.resolveCurrentUser(jwt);
        Optional<SellerProfile> existing = sellerProfileRepository.findFirstByUserIdOrderByAppliedAtDesc(
                user.getId());

        if (existing.isPresent()) {
            SellerStatus status = existing.get().getStatus();
            if (status == SellerStatus.PENDING || status == SellerStatus.APPROVED) {
                throw new ConflictException("seller.application.exists");
            }
            if (status == SellerStatus.HOLD) {
                return resubmit(existing.get(), request);
            }
            // REJECTED / REVOKED — purani application terminal hai, neeche naya application banega.
        }

        return createNew(user, request);
    }

    private SellerApplicationStatusResponse createNew(User user, SellerApplyRequest request) {
        SellerProfile profile = new SellerProfile();
        profile.setUserId(user.getId());
        applyRequestFields(profile, request);
        profile.setStatus(SellerStatus.PENDING);
        profile.setAppliedAt(LocalDateTime.now());

        // Product turant banta hai lekin inventory-service ke andar "active=false" — jab tak admin
        // approve nahi karta, public catalog mein nahi dikhega. Ye call fail hui toh @Transactional
        // poora SellerProfile insert bhi rollback kar dega — koi dangling PENDING row nahi bachegi.
        InventoryProductResponse product = inventoryClient.createProduct(toProductRequest(user.getId(),
                request.getInitialProduct()));
        profile.setProductId(product.getId());

        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), null, SellerStatus.PENDING, null, HistoryActor.SELLER);
        return toStatusResponse(profile);
    }

    // HOLD se resubmit — same row update hoti hai, naya row nahi banta. Product correction
    // jaanbujh kar scope se bahar hai — inventoryClient ko yahan call hi nahi karte, productId
    // waisa hi rehta hai jaisa pehli apply pe bana tha. Purana admin_remark tab tak visible
    // rehta hai jab tak admin dobara review na kare.
    private SellerApplicationStatusResponse resubmit(SellerProfile profile, SellerApplyRequest request) {
        applyRequestFields(profile, request);
        profile.setStatus(SellerStatus.PENDING);
        profile.setCorrectionSubmittedAt(LocalDateTime.now());

        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), SellerStatus.HOLD, SellerStatus.PENDING, null, HistoryActor.SELLER);
        return toStatusResponse(profile);
    }

    private void applyRequestFields(SellerProfile profile, SellerApplyRequest request) {
        profile.setStoreName(request.getStoreName());
        profile.setBusinessName(request.getBusinessName());
        profile.setBusinessType(request.getBusinessType());
        profile.setBusinessEmail(request.getBusinessEmail());
        profile.setBusinessPhone(request.getBusinessPhone());
        profile.setSellsOnlyBooks(request.isSellsOnlyBooks());
        profile.setRegistrationNumber(request.getRegistrationNumber());
        profile.setPanNumber(request.getPanNumber());
        profile.setBankAccountHolderName(request.getBankAccountHolderName());
        profile.setBankAccountNumber(request.getBankAccountNumber());
        profile.setIfscCode(request.getIfscCode());
        profile.setPickupAddressLine1(request.getPickupAddress().getAddressLine1());
        profile.setPickupAddressLine2(request.getPickupAddress().getAddressLine2());
        profile.setPickupCity(request.getPickupAddress().getCity());
        profile.setPickupState(request.getPickupAddress().getState());
        profile.setPickupPincode(request.getPickupAddress().getPincode());
        profile.setCategories(request.getCategories());
    }

    public SellerApplicationStatusResponse getMyApplicationStatus(Jwt jwt) {
        User user = userProfileService.resolveCurrentUser(jwt);
        return sellerProfileRepository.findFirstByUserIdOrderByAppliedAtDesc(user.getId())
                .map(this::toStatusResponse)
                .orElseGet(() -> new SellerApplicationStatusResponse(SellerApplicationStatus.NONE, null, null, null,
                        null));
    }

    // Seller apna khud ka business/KYC profile dekhta hai — customer wale "/me" (MyDetailsResponse)
    // se alag, kyunki usme storeName/PAN/bank/pickup-address jaisi seller-specific fields hoti hi nahi.
    // Kisi bhi status (PENDING/HOLD included) pe kaam karta hai — "review my application" ke liye
    // bhi yahi endpoint use hota hai.
    // @Transactional zaroori hai: "categories" ek lazy @ElementCollection hai (open-in-view=false),
    // isliye session ko repository call ke baad, toSellerProfileResponse() tak zinda rakhna padta hai.
    @Transactional(readOnly = true)
    public SellerProfileResponse getMyProfile(Jwt jwt) {
        User user = userProfileService.resolveCurrentUser(jwt);
        SellerProfile profile = sellerProfileRepository.findFirstByUserIdOrderByAppliedAtDesc(user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("seller.profile.not.found"));
        return toSellerProfileResponse(profile);
    }

    // Seller apni PENDING ya HOLD application withdraw kar sakta hai. APPROVED/REJECTED/REVOKED
    // se revoke ka matlab nahi banta.
    @Transactional
    public SellerProfileResponse revoke(Jwt jwt) {
        User user = userProfileService.resolveCurrentUser(jwt);
        SellerProfile profile = sellerProfileRepository.findFirstByUserIdOrderByAppliedAtDesc(user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("seller.profile.not.found"));
        if (profile.getStatus() != SellerStatus.PENDING && profile.getStatus() != SellerStatus.HOLD) {
            throw new ConflictException("seller.application.not.revocable");
        }
        SellerStatus previousStatus = profile.getStatus();
        profile.setStatus(SellerStatus.REVOKED);
        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), previousStatus, SellerStatus.REVOKED, null, HistoryActor.SELLER);
        return toSellerProfileResponse(profile);
    }

    @Transactional(readOnly = true)
    public List<SellerProfileResponse> listByStatus(SellerStatus status) {
        return sellerProfileRepository.findByStatus(status).stream().map(this::toSellerProfileResponse).toList();
    }

    @Transactional
    public SellerProfileResponse approve(Long id) {
        SellerProfile profile = getPendingOrThrow(id);
        User applicant = userRepository.findById(profile.getUserId())
                .orElseThrow(() -> new ResourceNotFoundException("user.not.found", profile.getUserId()));

        // Pehle access (Keycloak role), phir visibility (product activate) — is order mein
        // koi hard dependency nahi hai, bas identity change ko pehle karna zyada sahi lagta hai.
        keycloakAdminService.assignRealmRole(applicant.getKeycloakId(), SELLER_ROLE);
        inventoryClient.activateProduct(profile.getProductId());

        profile.setStatus(SellerStatus.APPROVED);
        profile.setReviewedAt(LocalDateTime.now());
        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), SellerStatus.PENDING, SellerStatus.APPROVED, null, HistoryActor.ADMIN);
        return toSellerProfileResponse(profile);
    }

    @Transactional
    public SellerProfileResponse reject(Long id, String reason) {
        SellerProfile profile = getPendingOrThrow(id);
        profile.setStatus(SellerStatus.REJECTED);
        profile.setAdminRemark(reason);
        profile.setReviewedAt(LocalDateTime.now());
        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), SellerStatus.PENDING, SellerStatus.REJECTED, reason, HistoryActor.ADMIN);
        return toSellerProfileResponse(profile);
    }

    // Direct dismiss nahi — seller ko correction karke resubmit karne ka mauka milta hai
    // (SellerService.apply() HOLD se PENDING mein wapas le aata hai).
    @Transactional
    public SellerProfileResponse hold(Long id, String remark) {
        SellerProfile profile = getPendingOrThrow(id);
        profile.setStatus(SellerStatus.HOLD);
        profile.setAdminRemark(remark);
        profile.setReviewedAt(LocalDateTime.now());
        sellerProfileRepository.save(profile);
        recordHistory(profile.getId(), SellerStatus.PENDING, SellerStatus.HOLD, remark, HistoryActor.ADMIN);
        return toSellerProfileResponse(profile);
    }

    // Seller apni latest application ki poori journey dekhta hai.
    @Transactional(readOnly = true)
    public List<SellerApplicationHistoryEntry> getMyHistory(Jwt jwt) {
        User user = userProfileService.resolveCurrentUser(jwt);
        SellerProfile profile = sellerProfileRepository.findFirstByUserIdOrderByAppliedAtDesc(user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("seller.profile.not.found"));
        return getHistory(profile.getId());
    }

    // Admin kisi bhi specific application ki poori journey dekhta hai.
    public List<SellerApplicationHistoryEntry> getHistory(Long sellerProfileId) {
        return sellerApplicationHistoryRepository.findBySellerProfileIdOrderByOccurredAtAsc(sellerProfileId).stream()
                .map(this::toHistoryEntry)
                .toList();
    }

    private void recordHistory(Long sellerProfileId, SellerStatus fromStatus, SellerStatus toStatus, String remark,
            HistoryActor actor) {
        SellerApplicationHistory entry = new SellerApplicationHistory();
        entry.setSellerProfileId(sellerProfileId);
        entry.setFromStatus(fromStatus);
        entry.setToStatus(toStatus);
        entry.setRemark(remark);
        entry.setActor(actor);
        entry.setOccurredAt(LocalDateTime.now());
        sellerApplicationHistoryRepository.save(entry);
    }

    private SellerApplicationHistoryEntry toHistoryEntry(SellerApplicationHistory entry) {
        return new SellerApplicationHistoryEntry(entry.getFromStatus(), entry.getToStatus(), entry.getRemark(),
                entry.getActor(), entry.getOccurredAt());
    }

    private SellerProfile getPendingOrThrow(Long id) {
        SellerProfile profile = sellerProfileRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("seller.application.not.found", id));
        if (profile.getStatus() != SellerStatus.PENDING) {
            throw new ConflictException("seller.application.already.reviewed", id);
        }
        return profile;
    }

    private InventoryCreateProductRequest toProductRequest(Long sellerId, InitialProductRequest initialProduct) {
        InventoryCreateProductRequest request = new InventoryCreateProductRequest();
        request.setSellerId(sellerId);
        request.setName(initialProduct.getName());
        request.setBrand(initialProduct.getBrand());
        request.setCategory(initialProduct.getCategory());
        request.setDescription(initialProduct.getDescription());
        request.setPrice(initialProduct.getPrice());
        request.setDiscountPercentage(initialProduct.getDiscountPercentage());
        request.setStock(initialProduct.getStock());
        request.setMinimumOrderQuantity(initialProduct.getMinimumOrderQuantity());
        request.setSku(initialProduct.getSku());
        request.setTags(initialProduct.getTags());
        request.setWeight(initialProduct.getWeight());
        if (initialProduct.getDimensions() != null) {
            request.setWidth(initialProduct.getDimensions().getWidth());
            request.setHeight(initialProduct.getDimensions().getHeight());
            request.setDepth(initialProduct.getDimensions().getDepth());
        }
        request.setWarrantyInformation(initialProduct.getWarrantyInformation());
        request.setShippingInformation(initialProduct.getShippingInformation());
        request.setReturnPolicy(initialProduct.getReturnPolicy());
        return request;
    }

    private SellerApplicationStatusResponse toStatusResponse(SellerProfile profile) {
        SellerApplicationStatus status = SellerApplicationStatus.valueOf(profile.getStatus().name());
        return new SellerApplicationStatusResponse(status, profile.getStoreName(), profile.getAdminRemark(),
                profile.getAppliedAt(), profile.getReviewedAt());
    }

    private SellerProfileResponse toSellerProfileResponse(SellerProfile profile) {
        // "categories" ek lazy @ElementCollection hai — @Transactional method ke andar hone ke bawajood
        // isse eagerly ek plain ArrayList mein copy karna zaroori hai. Warna DTO field Hibernate ke
        // PersistentBag proxy ko hi refer karta reh jaata, aur Jackson use baad mein (session band hone
        // ke baad) serialize karne ki koshish karta — wahi LazyInitializationException.
        var categories = profile.getCategories() == null ? null : new ArrayList<>(profile.getCategories());
        return new SellerProfileResponse(profile.getId(), profile.getUserId(), profile.getStoreName(),
                profile.getBusinessName(), profile.getBusinessType(), profile.getBusinessEmail(),
                profile.getBusinessPhone(), profile.isSellsOnlyBooks(), profile.getRegistrationNumber(),
                profile.getPanNumber(), profile.getBankAccountHolderName(), profile.getBankAccountNumber(),
                profile.getIfscCode(), profile.getPickupAddressLine1(), profile.getPickupAddressLine2(),
                profile.getPickupCity(), profile.getPickupState(), profile.getPickupPincode(),
                categories, profile.getProductId(), profile.getStatus(), profile.getAdminRemark(),
                profile.getAppliedAt(), profile.getReviewedAt(), profile.getCorrectionSubmittedAt());
    }
}
