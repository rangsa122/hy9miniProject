package com.diymall.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diymall.dto.MemberDTO;
import com.diymall.dto.OrderDTO;
import com.diymall.dto.OrderItemDTO;

import com.diymall.service.OrderService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;


    /*
     * 주문하기
     */
    @PostMapping("/order/create")
    public String createOrder(
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // 로그인 회원 확인
        MemberDTO member =
            (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {

            redirectAttributes.addFlashAttribute(
                "error",
                "로그인이 필요합니다."
            );

            return "redirect:/member/login";
        }


        try {

            // 주문 생성
            int orderId =
                orderService.createOrder(
                    member.getMemberId()
                );

            // 주문 번호 전달
            redirectAttributes.addAttribute(
                "orderId",
                orderId
            );

            return "redirect:/order/complete";

        } catch (IllegalStateException e) {

            redirectAttributes.addFlashAttribute(
                "error",
                e.getMessage()
            );

            return "redirect:/cart";
        }
    }


    /*
     * 주문 완료 페이지
     */
    @GetMapping("/order/complete")
    public String complete(
            @RequestParam("orderId") int orderId,
            HttpSession session,
            org.springframework.ui.Model model) {

        // 로그인 확인
        MemberDTO member =
            (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }


        // 주문 조회
        OrderDTO order =
            orderService.getOrder(orderId);


        // 주문 정보 전달
        model.addAttribute(
            "order",
            order
        );

        return "order/complete";
    }
    
    
    @GetMapping("/order/list")
    public String orderList(
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        List<OrderDTO> orderList =
                orderService.getOrderListByMemberId(
                        member.getMemberId()
                );

        model.addAttribute("orderList", orderList);

        return "order/list";
    }
    
    @GetMapping("/order/detail")
    public String orderDetail(
            @RequestParam("orderId") int orderId,
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        OrderDTO order =
                orderService.getOrderDetailByMemberId(
                        orderId,
                        member.getMemberId()
                );

        if (order == null) {
            return "redirect:/order/list";
        }

        List<OrderItemDTO> orderItemList =
                orderService.getOrderItems(orderId);

        model.addAttribute("order", order);
        model.addAttribute("orderItemList", orderItemList);

        return "order/detail";
    }
}