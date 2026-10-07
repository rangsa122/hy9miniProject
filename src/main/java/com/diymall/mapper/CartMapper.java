package com.diymall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.diymall.dto.CartDTO;
import com.diymall.dto.CartItemDTO;

@Mapper
public interface CartMapper {

    CartDTO selectCartByMemberId(int memberId);

    void insertCart(CartDTO cart);

    void insertCartItem(CartItemDTO cartItem);

    CartItemDTO selectCartItem(
            int cartId,
            int productId
    );

    void updateCartItemQuantity(
            int cartItemId,
            int quantity
    );

    List<CartItemDTO> selectCartItems(int cartId);

    void deleteCartItem(int cartItemId);

}