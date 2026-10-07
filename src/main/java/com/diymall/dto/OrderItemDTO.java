package com.diymall.dto;

import lombok.Data;

@Data
public class OrderItemDTO {

    private int orderItemId;
    private int orderId;
    private int productId;
    private int quantity;
    private int price;

    private String productName;
    private String image;

    public int getTotalPrice() {
        return price * quantity;
    }
}