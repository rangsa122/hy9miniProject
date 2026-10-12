package com.diymall.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ProductDTO {

    private int productId;
    private String productName;
    private String category;
    private String difficulty;
    private String description;
    private int price;
    private int stock;
    private String image;
    private LocalDateTime createdAt;
}