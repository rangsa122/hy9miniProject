package com.diymall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diymall.dto.CartDTO;
import com.diymall.dto.CartItemDTO;
import com.diymall.mapper.CartMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartMapper cartMapper;


    /// 회원의 장바구니를 가져온다.
    /// 없으면 새로 만든다.

    public CartDTO getOrCreateCart(int memberId) {

        CartDTO cart =
                cartMapper.selectCartByMemberId(memberId);

        if (cart == null) {

            cart = new CartDTO();
            cart.setMemberId(memberId);

            cartMapper.insertCart(cart);

            cart =
                cartMapper.selectCartByMemberId(memberId);
        }

        return cart;
    }


    /// 장바구니에 상품을 추가

    @Transactional
    public void addCart(
            int memberId,
            int productId,
            int quantity) {

        CartDTO cart =
                getOrCreateCart(memberId);

        CartItemDTO cartItem =
                cartMapper.selectCartItem(
                    cart.getCartId(),
                    productId
                );

        if (cartItem == null) {

            cartItem = new CartItemDTO();

            cartItem.setCartId(cart.getCartId());
            cartItem.setProductId(productId);
            cartItem.setQuantity(quantity);

            cartMapper.insertCartItem(cartItem);

        } else {

            int newQuantity =
                    cartItem.getQuantity() + quantity;

            cartMapper.updateCartItemQuantity(
                cartItem.getCartItemId(),
                newQuantity
            );
        }
    }


    /// 장바구니 목록 조회

    public List<CartItemDTO> getCartItems(
            int memberId) {

        CartDTO cart =
                getOrCreateCart(memberId);

        return cartMapper.selectCartItems(
            cart.getCartId()
        );
    }


    /// 수량 변경
    public void updateQuantity(
            int cartItemId,
            int quantity) {

        cartMapper.updateCartItemQuantity(
            cartItemId,
            quantity
        );
    }


    /// 상품 삭제
    public void deleteItem(
            int cartItemId) {

        cartMapper.deleteCartItem(
            cartItemId
        );
    }
}