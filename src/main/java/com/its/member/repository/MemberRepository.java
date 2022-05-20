package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {
    return sql.insert("Member.save", memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
       return sql.selectOne("Member.login", memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.memberList");
    }

    public MemberDTO findById(Long id) {
       return sql.selectOne("Member.findById", id);
    }

    public int delete(Long id) {
        return sql.delete("Member.deleteId", id);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.updateId", memberDTO);
    }

    public @ResponseBody String duplicateCheck(String memberId) {
        String checkResult = sql.selectOne("Member.memberId", memberId);
        return checkResult; // ok.jsp또는 no.jsp 를 찾음
    }
}
