package com.diymall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.diymall.dto.MemberDTO;

@Mapper
public interface MemberMapper {

    int insertMember(MemberDTO member);

    MemberDTO selectMemberByUserId(String userId);

    List<MemberDTO> selectMemberList();
    
}