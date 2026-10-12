package com.diymall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diymall.dto.MemberDTO;
import com.diymall.dto.ReviewDTO;
import com.diymall.service.ReviewService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    // 상품별 리뷰 조회
    @GetMapping("/review/list")
    public String reviewList(
            @RequestParam("productId") int productId,
            Model model) {

        List<ReviewDTO> reviewList =
                reviewService.getReviewsByProductId(productId);

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("productId", productId);

        return "review/list";
    }

    // 리뷰 등록
    @PostMapping("/review/add")
    public String addReview(
            ReviewDTO review,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        // 로그인하지 않은 경우
        if (member == null) {
            redirectAttributes.addFlashAttribute(
                    "error",
                    "로그인이 필요합니다.");

            return "redirect:/member/login";
        }

        // 로그인한 회원의 ID 사용
        review.setMemberId(member.getMemberId());

        reviewService.addReview(review);

        return "redirect:/review/list?productId="
                + review.getProductId();
    }

    // 리뷰 삭제
    @PostMapping("/review/delete")
    public String deleteReview(
            @RequestParam("reviewId") int reviewId,
            @RequestParam("productId") int productId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        // 로그인하지 않은 경우
        if (member == null) {
            redirectAttributes.addFlashAttribute(
                    "error",
                    "로그인이 필요합니다.");

            return "redirect:/member/login";
        }

        ReviewDTO review =
                reviewService.getReview(reviewId);

        // 존재하지 않는 리뷰
        if (review == null) {
            redirectAttributes.addFlashAttribute(
                    "error",
                    "존재하지 않는 리뷰입니다.");

            return "redirect:/review/list?productId="
                    + productId;
        }

        // 본인이 작성한 리뷰인지 확인
        if (review.getMemberId() != member.getMemberId()) {
            redirectAttributes.addFlashAttribute(
                    "error",
                    "본인이 작성한 리뷰만 삭제할 수 있습니다.");

            return "redirect:/review/list?productId="
                    + productId;
        }

        reviewService.deleteReview(reviewId);

        return "redirect:/review/list?productId="
                + productId;
    }
}