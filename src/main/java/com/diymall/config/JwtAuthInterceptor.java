package com.diymall.config;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.diymall.service.JwtService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class JwtAuthInterceptor implements HandlerInterceptor {

    public static final String LOGIN_MEMBER_ATTRIBUTE = "loginMember";
    public static final String JWT_COOKIE_NAME = "ACCESS_TOKEN";

    private final JwtService jwtService;

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws IOException {

        String uri = request.getRequestURI()
                .substring(request.getContextPath().length());

        String token = getTokenFromCookie(request);

        Claims claims = token == null
                ? null
                : jwtService.validateToken(token);

        // 로그인한 사용자라면 공개 페이지에서도 헤더에 로그인 정보 전달
        if (claims != null) {
            request.setAttribute(
                    LOGIN_MEMBER_ATTRIBUTE,
                    claimsToMemberView(claims)
            );
        }

        // 공개 페이지는 로그인하지 않아도 접근 가능
        if (isPublicPath(uri)) {
            return true;
        }

        // 보호된 페이지는 유효한 JWT가 필요
        if (claims == null) {
            response.sendRedirect(
                    request.getContextPath() + "/member/login"
            );
            return false;
        }

        // 관리자 페이지는 ADMIN 권한 필요
        if (uri.startsWith("/admin")) {
            String role = claims.get("role", String.class);

            if (!"ADMIN".equals(role)) {
                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "관리자 권한이 필요합니다."
                );
                return false;
            }
        }

        return true;
    }

    private boolean isPublicPath(String uri) {
        return uri.equals("/")
                || uri.equals("/error")
                || uri.equals("/favicon.ico")
                || uri.equals("/member/login")
                || uri.equals("/member/join")
                || uri.equals("/member/logout")
                || uri.startsWith("/css/")
                || uri.startsWith("/js/")
                || uri.startsWith("/images/")
                || uri.startsWith("/product/")
                || uri.equals("/review/list")
                || uri.startsWith("/webjars/");
    }

    private String getTokenFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            return null;
        }

        for (Cookie cookie : cookies) {
            if (JWT_COOKIE_NAME.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }

        return null;
    }

    private MemberView claimsToMemberView(Claims claims) {
        return new MemberView(
                claims.get("memberId", Integer.class),
                claims.getSubject(),
                claims.get("name", String.class),
                claims.get("role", String.class)
        );
    }

    public record MemberView(
            Integer memberId,
            String userId,
            String name,
            String role) {
    }
}
