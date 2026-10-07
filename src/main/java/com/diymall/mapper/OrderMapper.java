package com.diymall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.diymall.dto.OrderDTO;
import com.diymall.dto.OrderItemDTO;

@Mapper
public interface OrderMapper {

    // 주문 기본 정보 저장
    void insertOrder(OrderDTO order);

    // 주문 상품 정보 저장
    void insertOrderItem(OrderItemDTO orderItem);

    // 주문 번호로 주문 조회
    OrderDTO selectOrderById(int orderId);

    // 주문에 포함된 상품 목록 조회
    List<OrderItemDTO> selectOrderItems(int orderId);
    
    // 관리자 주문 관리
    List<OrderDTO> selectOrderList();

    OrderDTO selectOrderDetail(int orderId);

    void updateOrderStatus(OrderDTO order);
    
    // 회원 주문 내역
    List<OrderDTO> selectOrderListByMemberId(int memberId);

    OrderDTO selectOrderDetailByMemberId(
            int orderId,
            int memberId
    );
}