package com.diymall.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diymall.config.JwtAuthInterceptor;
import com.diymall.config.JwtAuthInterceptor.MemberView;
import com.diymall.dto.MemberDTO;
import com.diymall.service.JwtService;
import com.diymall.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final JwtService jwtService;

    // 회원가입 화면
    @GetMapping("/join")
    public String joinForm() {
        return "member/join";
    }

    // 회원가입 처리
    @PostMapping("/join")
    public String join(MemberDTO member, Model model) {
        memberService.join(member);
        model.addAttribute("message", "회원가입이 완료되었습니다.");
        return "member/joinResult";
    }

    // 로그인 화면
    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    // JWT 로그인
    @PostMapping("/login")
    public String login(
            String userId,
            String password,
            HttpServletRequest request,
            HttpServletResponse response,
            Model model) {

        MemberDTO member = memberService.login(userId, password);

        if (member == null) {
            model.addAttribute(
                    "error",
                    "아이디 또는 비밀번호가 올바르지 않습니다."
            );
            return "member/login";
        }

        String token = jwtService.createToken(
                member.getMemberId(),
                member.getUserId(),
                member.getName(),
                member.getRole()
        );

        String contextPath = request.getContextPath();
        String cookiePath = contextPath.isEmpty() ? "/" : contextPath;

        ResponseCookie cookie = ResponseCookie
                .from(JwtAuthInterceptor.JWT_COOKIE_NAME, token)
                .httpOnly(true)
                .secure(request.isSecure())
                .path(cookiePath)
                .maxAge(1800)
                .sameSite("Lax")
                .build();

        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());

        return "redirect:/";
    }

    // 로그아웃: JWT 쿠키 만료
    @GetMapping("/logout")
    public String logout(
            HttpServletRequest request,
            HttpServletResponse response) {

        String contextPath = request.getContextPath();
        String cookiePath = contextPath.isEmpty() ? "/" : contextPath;

        ResponseCookie cookie = ResponseCookie
                .from(JwtAuthInterceptor.JWT_COOKIE_NAME, "")
                .httpOnly(true)
                .secure(request.isSecure())
                .path(cookiePath)
                .maxAge(0)
                .sameSite("Lax")
                .build();

        response.addHeader(HttpHeaders.SET_COOKIE, cookie.toString());

        return "redirect:/";
    }

    // 마이페이지
    @GetMapping("/mypage")
    public String myPage(
            HttpServletRequest request,
            Model model) {

        Object loginObject = request.getAttribute(
                JwtAuthInterceptor.LOGIN_MEMBER_ATTRIBUTE
        );

        if (!(loginObject instanceof MemberView loginMember)
                || loginMember.memberId() == null) {
            return "redirect:/member/login";
        }

        // JWT에는 가입일과 이메일이 없으므로 DB에서 최신 회원 정보 조회
        MemberDTO member = memberService.getMemberById(
                loginMember.memberId()
        );

        if (member == null) {
            return "redirect:/member/logout";
        }

        model.addAttribute("member", member);

        return "member/mypage";
    }
}
