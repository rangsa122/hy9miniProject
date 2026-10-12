package com.diymall.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class ReviewDTO {

    private int reviewId;
    private int memberId;
    private int productId;
    private String content;
    private LocalDateTime createdAt;

    // 리뷰 화면에서 보여주기 위한 정보
    private String memberName;
    private String productName;
    
    public String getFormattedCreatedAt() {

        if (createdAt == null) {
            return "";
        }

        return createdAt.format(
            DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm")
        );
    }
}

