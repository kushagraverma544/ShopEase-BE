package com.example.user_service.dto;

import lombok.Data;

@Data
public class DimensionsRequest {
    private Double width;
    private Double height;
    private Double depth;
}
