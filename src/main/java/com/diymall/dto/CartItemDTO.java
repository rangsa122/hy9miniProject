package com.diymall.dto;

import lombok.Data;

@Data
public class CartItemDTO {

    private int cartItemId;
    private int cartId;
    private int productId;
    private int quantity;

    // 장바구니 화면에서 상품 정보를 같이 보여주기 위한 값
    private String productName;
    private int price;
    private String image;
    private int stock;

    public int getTotalPrice() {
        return price * quantity;
    }
}