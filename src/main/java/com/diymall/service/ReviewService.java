package com.diymall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diymall.dto.ReviewDTO;
import com.diymall.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewMapper reviewMapper;

    // 리뷰 등록
    @Transactional
    public void addReview(ReviewDTO review) {
        reviewMapper.insertReview(review);
    }

    // 상품별 리뷰 조회
    public List<ReviewDTO> getReviewsByProductId(int productId) {
        return reviewMapper.selectReviewsByProductId(productId);
    }

    // 리뷰 하나 조회
    public ReviewDTO getReview(int reviewId) {
        return reviewMapper.selectReviewById(reviewId);
    }

    // 리뷰 삭제
    @Transactional
    public void deleteReview(int reviewId) {
        reviewMapper.deleteReview(reviewId);
    }
}