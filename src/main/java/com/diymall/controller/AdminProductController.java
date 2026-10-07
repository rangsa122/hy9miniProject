package com.diymall.controller;

import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.diymall.dto.MemberDTO;
import com.diymall.dto.ProductDTO;
import com.diymall.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class AdminProductController {

    private final ProductService productService;

    // 관리자 상품 목록
    @GetMapping("/admin/product/list")
    public String productList(
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        // 로그인하지 않은 경우
        if (member == null) {
            return "redirect:/member/login";
        }

        // 관리자가 아닌 경우
        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        List<ProductDTO> productList =
                productService.getProductList();

        model.addAttribute("productList", productList);

        return "admin/product/list";
    }
    
    // 상품 등록 화면
    @GetMapping("/admin/product/write")
    public String productWrite(
            HttpSession session) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        return "admin/product/write";
    }


    // 상품 등록 처리
    @PostMapping("/admin/product/add")
    public String productAdd(
            ProductDTO product,
            HttpSession session) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        productService.addProduct(product);

        return "redirect:/admin/product/list";
    }
    
    @GetMapping("/admin/product/edit")
    public String productEdit(
            @RequestParam("productId") int productId,
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

        ProductDTO product =
                productService.getProduct(productId);

        if (product == null) {
            return "redirect:/admin/product/list";
        }

        model.addAttribute("product", product);

        return "admin/product/edit";
    }


    @PostMapping("/admin/product/update")
    public String productUpdate(
            ProductDTO product,
            HttpSession session) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        if (!"ADMIN".equals(member.getRole())) {
            return "redirect:/";
        }

        productService.updateProduct(product);

        return "redirect:/admin/product/list";
    }
    
    @PostMapping("/admin/product/delete")
    public String productDelete(
            @RequestParam("productId") int productId,
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

        try {

            productService.deleteProduct(productId);

            redirectAttributes.addFlashAttribute(
                    "message",
                    "상품이 삭제되었습니다."
            );

        } catch (IllegalStateException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );
        }

        return "redirect:/admin/product/list";
    }
    
}