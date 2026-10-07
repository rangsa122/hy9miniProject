package com.diymall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diymall.dto.MemberDTO;
import com.diymall.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;


    // =========================
    // 회원가입
    // =========================

    @GetMapping("/join")
    public String joinForm() {

        return "member/join";
    }


    @PostMapping("/join")
    public String join(
            MemberDTO member,
            Model model) {

        memberService.join(member);

        model.addAttribute(
            "message",
            "회원가입이 완료되었습니다."
        );

        return "member/joinResult";
    }


    // =========================
    // 로그인
    // =========================

    @GetMapping("/login")
    public String loginForm() {

        return "member/login";
    }


    @PostMapping("/login")
    public String login(
            String userId,
            String password,
            HttpSession session,
            Model model) {

        MemberDTO member =
                memberService.login(userId, password);

        if (member == null) {

            model.addAttribute(
                "error",
                "아이디 또는 비밀번호가 올바르지 않습니다."
            );

            return "member/login";
        }


        // 로그인 성공 ~_~
        session.setAttribute(
            "loginMember",
            member
        );

        return "redirect:/";
    }


    // =========================
    // 로그아웃
    // =========================

    @GetMapping("/logout")
    public String logout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }
    
    
    // =========================
    // 마이 페이지
    // =========================
    
    @GetMapping("/mypage")
    public String myPage(
            HttpSession session,
            Model model) {

        MemberDTO member =
                (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            return "redirect:/member/login";
        }

        model.addAttribute("member", member);

        return "member/mypage";
    }
}