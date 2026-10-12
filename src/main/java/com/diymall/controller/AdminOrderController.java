package com.diymall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class AdminOrderController {

    private final OrderService orderService;

    @GetMapping("/admin/order/list")
    public String orderList(
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        List<OrderDTO> orderList =
                orderService.getOrderList();

        model.addAttribute("orderList", orderList);

        return "admin/order/list";
    }


    @GetMapping("/admin/order/detail")
    public String orderDetail(
            @RequestParam("orderId") int orderId,
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        OrderDTO order =
                orderService.getOrderDetail(orderId);

        if (order == null) {
            return "redirect:/admin/order/list";
        }

        List<OrderItemDTO> orderItemList =
                orderService.getOrderItems(orderId);

        model.addAttribute("order", order);
        model.addAttribute("orderItemList", orderItemList);

        return "admin/order/detail";
    }


    @PostMapping("/admin/order/status")
    public String updateOrderStatus(
            OrderDTO order,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        orderService.updateOrderStatus(order);

        redirectAttributes.addFlashAttribute(
                "message",
                "주문 상태가 변경되었습니다."
        );

        return "redirect:/admin/order/detail?orderId="
                + order.getOrderId();
    }
}