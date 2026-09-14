package com.example.user_service.service;

import com.example.user_service.dto.AddressRequest;
import com.example.user_service.dto.AddressResponse;
import com.example.user_service.entity.User;
import com.example.user_service.entity.UserAddress;
import com.example.user_service.exception.ResourceNotFoundException;
import com.example.user_service.repository.UserAddressRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserAddressService {

    private final UserAddressRepository userAddressRepository;
    private final UserProfileService userProfileService;

    public List<AddressResponse> getAddresses(Jwt jwt) {
        User user = userProfileService.resolveCurrentUser(jwt);
        return userAddressRepository.findByUserId(user.getId()).stream().map(this::toResponse).toList();
    }

    @Transactional
    public AddressResponse createAddress(Jwt jwt, AddressRequest request) {
        User user = userProfileService.resolveCurrentUser(jwt);
        UserAddress address = new UserAddress();
        address.setUserId(user.getId());
        applyRequest(address, request);
        return toResponse(userAddressRepository.save(address));
    }

    @Transactional
    public AddressResponse updateAddress(Jwt jwt, Long addressId, AddressRequest request) {
        UserAddress address = findOwnedAddress(jwt, addressId);
        applyRequest(address, request);
        return toResponse(userAddressRepository.save(address));
    }

    @Transactional
    public void deleteAddress(Jwt jwt, Long addressId) {
        UserAddress address = findOwnedAddress(jwt, addressId);
        userAddressRepository.delete(address);
    }

    // Address kisi aur user ki hai ya exist hi nahi karti — dono cases me "not found" hi dete hain,
    // taaki doosre user ke address ka existence bhi leak na ho.
    private UserAddress findOwnedAddress(Jwt jwt, Long addressId) {
        User user = userProfileService.resolveCurrentUser(jwt);
        UserAddress address = userAddressRepository.findById(addressId)
                .orElseThrow(() -> new ResourceNotFoundException("address.not.found", addressId));
        if (!address.getUserId().equals(user.getId())) {
            throw new ResourceNotFoundException("address.not.found", addressId);
        }
        return address;
    }

    private void applyRequest(UserAddress address, AddressRequest request) {
        address.setType(request.getType());
        address.setRecipientName(request.getRecipientName());
        address.setPhone(request.getPhone());
        address.setAddressLine1(request.getAddressLine1());
        address.setAddressLine2(request.getAddressLine2());
        address.setCity(request.getCity());
        address.setState(request.getState());
        address.setPincode(request.getPincode());
        address.setDefaultAddress(request.isDefaultAddress());
    }

    private AddressResponse toResponse(UserAddress address) {
        return new AddressResponse(address.getId(), address.getType(), address.getRecipientName(),
                address.getPhone(), address.getAddressLine1(), address.getAddressLine2(), address.getCity(),
                address.getState(), address.getPincode(), address.isDefaultAddress());
    }
}
