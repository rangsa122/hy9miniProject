package com.diymall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.diymall.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

    // 리뷰 등록
    void insertReview(ReviewDTO review);

    // 상품별 리뷰 조회
    List<ReviewDTO> selectReviewsByProductId(int productId);

    // 리뷰 하나 조회
    ReviewDTO selectReviewById(int reviewId);

    // 리뷰 삭제
    void deleteReview(int reviewId);
}