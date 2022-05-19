package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/")
    public String index() {
        return "index";
    }
    @GetMapping("/save-form")
    public String saveForm() {
        return "save";
    }
    @GetMapping ("/login-form")
    public String loginForm() {
        return "login";
    }
    @GetMapping ("/findAll-form")
    public String findAllForm(Model model) {
        List<MemberDTO> memberDTOList  = memberService.findAll();
        model.addAttribute("memberDTOList", memberDTOList);
        return "list";
    }
    @PostMapping ("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult) {
            System.out.println("회원가입을 축하드립니다.");
            return "index";
        } else {
            System.out.println("회원가입에 실패하였습니다.");
            return "save-fail";
        }
    }
    @PostMapping ("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginMember = memberService.login(memberDTO);
        //session
        if(loginMember!=null) {
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "main";
        } else {
            return "login";
        }
    }

}
