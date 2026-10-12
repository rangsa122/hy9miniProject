package com.diymall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diymall.dto.MemberDTO;
import com.diymall.service.CartService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;


    /// 장바구니 담기
    @PostMapping("/cart/add")
    public String addCart(
            @RequestParam("productId") int productId,
            @RequestParam("quantity") int quantity,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        MemberDTO member =
                (MemberDTO) session.getAttribute(
                    "loginMember"
                );

        // 로그인하지 않은 경우
        if (member == null) {

            redirectAttributes.addFlashAttribute(
                "error",
                "로그인이 필요합니다."
            );

            return "redirect:/member/login";
        }


        cartService.addCart(
            member.getMemberId(),
            productId,
            quantity
        );

        return "redirect:/cart";
    }


    /// 장바구니 조회

    @GetMapping("/cart")
    public String cart(
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute(
                    "loginMember"
                );

        if (member == null) {
            return "redirect:/member/login";
        }


        model.addAttribute(
            "cartItems",
            cartService.getCartItems(
                member.getMemberId()
            )
        );

        return "cart/cart";
    }


    /// 수량 변경

    @PostMapping("/cart/update")
    public String update(
            @RequestParam("cartItemId") int cartItemId,
            @RequestParam("quantity") int quantity) {

        if (quantity < 1) {
            quantity = 1;
        }

        cartService.updateQuantity(
            cartItemId,
            quantity
        );

        return "redirect:/cart";
    }


    /// 상품 삭제

    @PostMapping("/cart/delete")
    public String delete(
            @RequestParam("cartItemId") int cartItemId) {

        cartService.deleteItem(
            cartItemId
        );

        return "redirect:/cart";
    }
}