package com.example.user_service.dto;

import jakarta.validation.constraints.NotBlank;
import java.time.LocalDate;
import lombok.Data;

@Data
public class PersonalDetailsRequest {

    @NotBlank(message = "fullName is required")
    private String fullName;

    private String gender;
    private LocalDate dateOfBirth;
    private String preferredLanguage;
}
