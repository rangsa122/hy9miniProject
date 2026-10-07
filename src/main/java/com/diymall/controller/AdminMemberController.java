package com.diymall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.diymall.dto.MemberDTO;
import com.diymall.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminMemberController {

    private final MemberService memberService;

    @GetMapping("/admin/member/list")
    public String memberList(
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

        List<MemberDTO> memberList =
                memberService.getMemberList();

        model.addAttribute("memberList", memberList);

        return "admin/member/list";
    }
}