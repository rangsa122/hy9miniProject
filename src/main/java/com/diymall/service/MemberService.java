package com.diymall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.diymall.dto.MemberDTO;
import com.diymall.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    public int join(MemberDTO member) {
        return memberMapper.insertMember(member);
    }

    public MemberDTO login(String userId, String password) {

        MemberDTO member = memberMapper.selectMemberByUserId(userId);

        if (member == null) {
            return null;
        }

        if (!member.getPassword().equals(password)) {
            return null;
        }

        return member;
    }
    
    public List<MemberDTO> getMemberList() {
        return memberMapper.selectMemberList();
    }
}