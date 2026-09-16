package com.example.inventory_service.entity;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "products")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // user-service ke SellerProfile ka owner — real FK nahi (alag DB, alag service), bas ek plain column.
    @Column(name = "seller_id")
    private Long sellerId;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(length = 100)
    private String brand;

    @Column(length = 100)
    private String category;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal price;

    @Column(name = "discount_percentage", precision = 5, scale = 2)
    private BigDecimal discountPercentage;

    @Column(nullable = false)
    private Integer stock;

    @Column(name = "minimum_order_quantity")
    private Integer minimumOrderQuantity;

    @Column(length = 50)
    private String sku;

    @ElementCollection
    @CollectionTable(name = "product_tags", joinColumns = @JoinColumn(name = "product_id"))
    @Column(name = "tag")
    private List<String> tags;

    private Double weight;

    private Double width;

    private Double height;

    private Double depth;

    @Column(name = "warranty_information")
    private String warrantyInformation;

    @Column(name = "shipping_information")
    private String shippingInformation;

    @Column(name = "return_policy")
    private String returnPolicy;

    // Seller apply karte hi product ban jaata hai, lekin false — jab tak admin uski SellerProfile
    // approve nahi karta, public catalog (jab banega) me ye product nahi dikhega.
    @Column(nullable = false)
    private boolean active;
}
