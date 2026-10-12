package com.diymall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.diymall.dto.ProductDTO;
import com.diymall.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @GetMapping("/detail")
    public String productDetail(
            @RequestParam("productId") int productId,
            Model model) {

        model.addAttribute("product", productService.getProduct(productId));

        return "product/detail";
    }
    
    @GetMapping("/list")
    public String productList(Model model) {

        model.addAttribute(
            "productList",
            productService.getProductList()
        );

        return "product/list";
    }
}