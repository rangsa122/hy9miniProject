package com.diymall.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CartDTO {

    private int cartId;
    private int memberId;
    private LocalDateTime createdAt;
}