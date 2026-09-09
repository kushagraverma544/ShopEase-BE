package com.example.inventory_service.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// "url" jaanbujh kar nahi rakha — dummyjson wahi field me apna khud ka URL bhejta hai,
// FE ko wo directly expose karna galat hoga (FE ko sirf hamare API se hi baat karni chahiye).
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {
    private String slug;
    private String name;
}
