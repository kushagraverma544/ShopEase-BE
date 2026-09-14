package com.example.user_service.dto;

import java.time.LocalDate;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// "GET /me" ka poora contract — page ek hi call me render ho sake isliye personal+contact+addresses sab ek saath.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyDetailsResponse {
    private Long id;
    private String fullName;
    private String email;
    private boolean emailVerified;
    private String gender;
    private LocalDate dateOfBirth;
    private String preferredLanguage;
    private String mobileNumber;
    private String alternateNumber;
    private boolean mobileVerified;
    private boolean otpLoginEnabled;
    private List<AddressResponse> addresses;
}
