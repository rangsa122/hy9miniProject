package com.diymall.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class MemberDTO {

    private int memberId;
    private String userId;
    private String password;
    private String name;
    private String email;
    private String role;
    private LocalDateTime createdAt;
    
    public String getFormattedCreatedAt() {

        if (createdAt == null) {
            return "";
        }

        return createdAt.format(
            DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        );
    }
}