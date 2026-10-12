package com.diymall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diymall.dto.CartDTO;
import com.diymall.dto.CartItemDTO;
import com.diymall.dto.OrderDTO;
import com.diymall.dto.OrderItemDTO;
import com.diymall.mapper.CartMapper;
import com.diymall.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderMapper orderMapper;
    private final CartMapper cartMapper;


    /*
     * 장바구니 상품으로 주문 생성
     */
    @Transactional
    public int createOrder(int memberId) {

        // 1. 회원의 장바구니 가져오기
        CartDTO cart =
            cartMapper.selectCartByMemberId(memberId);

        if (cart == null) {
            throw new IllegalStateException(
                "장바구니가 존재하지 않습니다."
            );
        }


        // 2. 장바구니 상품 가져오기
        List<CartItemDTO> cartItems =
            cartMapper.selectCartItems(cart.getCartId());

        if (cartItems == null || cartItems.isEmpty()) {
            throw new IllegalStateException(
                "장바구니가 비어 있습니다."
            );
        }


        // 3. 총 주문 금액 계산
        int totalPrice = 0;

        for (CartItemDTO item : cartItems) {
            totalPrice += item.getTotalPrice();
        }


        // 4. 주문 기본 정보 생성
        OrderDTO order = new OrderDTO();

        order.setMemberId(memberId);
        order.setTotalPrice(totalPrice);
        order.setOrderStatus("주문접수");


        // 5. ORDERS 테이블에 주문 저장
        orderMapper.insertOrder(order);


        // 6. ORDER_ITEM 테이블에 상품 저장
        for (CartItemDTO item : cartItems) {

            OrderItemDTO orderItem =
                new OrderItemDTO();

            orderItem.setOrderId(
                order.getOrderId()
            );

            orderItem.setProductId(
                item.getProductId()
            );

            orderItem.setQuantity(
                item.getQuantity()
            );

            orderItem.setPrice(
                item.getPrice()
            );

            orderMapper.insertOrderItem(orderItem);
        }


        // 7. 장바구니 상품 삭제
        for (CartItemDTO item : cartItems) {

            cartMapper.deleteCartItem(
                item.getCartItemId()
            );
        }


        // 8. 생성된 주문 번호 반환
        return order.getOrderId();
    }


    /*
     * 주문 기본 정보 조회
     */
    public OrderDTO getOrder(int orderId) {
        return orderMapper.selectOrderById(orderId);
    }


    /*
     * 주문 상품 조회
     */
    public List<OrderItemDTO> getOrderItems(int orderId) {
        return orderMapper.selectOrderItems(orderId);
    }
    
    
    public List<OrderDTO> getOrderList() {
        return orderMapper.selectOrderList();
    }

    public OrderDTO getOrderDetail(int orderId) {
        return orderMapper.selectOrderDetail(orderId);
    }

    public void updateOrderStatus(OrderDTO order) {
        orderMapper.updateOrderStatus(order);
    }
    
    
    public List<OrderDTO> getOrderListByMemberId(int memberId) {

        return orderMapper.selectOrderListByMemberId(memberId);
    }
    
    public OrderDTO getOrderDetailByMemberId(
            int orderId,
            int memberId) {

        return orderMapper.selectOrderDetailByMemberId(
                orderId,
                memberId
        );
    }
}