package com.example.user_service.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 100)
	private String name;

	@Column(nullable = false, unique = true, length = 150)
	private String email;

	// Keycloak ke JWT "sub" claim se link — pehli authenticated call pe JIT-provision/link hota hai.
	@Column(name = "keycloak_id", unique = true, length = 64)
	private String keycloakId;

	@Column(length = 20)
	private String gender;

	@Column(name = "date_of_birth")
	private LocalDate dateOfBirth;

	@Column(name = "preferred_language", length = 50)
	private String preferredLanguage;

	@Column(name = "mobile_number", length = 20)
	private String mobileNumber;

	@Column(name = "alternate_number", length = 20)
	private String alternateNumber;

	@Column(name = "email_verified", nullable = false)
	private boolean emailVerified;

	@Column(name = "mobile_verified", nullable = false)
	private boolean mobileVerified;

	// Sirf preference store hota hai — actual OTP-based login flow abhi implement nahi hai.
	@Column(name = "otp_login_enabled", nullable = false)
	private boolean otpLoginEnabled;
}
