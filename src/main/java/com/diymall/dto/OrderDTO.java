package com.diymall.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OrderDTO {

    private int orderId;
    private int memberId;
    private int totalPrice;
    private String orderStatus;
    private LocalDateTime createdAt;
    
    private String userId;
    private String name;
}