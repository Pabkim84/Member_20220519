package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping("/detail")
    public String findById (@RequestParam ("id") Long id, Model model) {
        MemberDTO detailMember = memberService.findById(id);
        model.addAttribute("detailMember", detailMember);

        return "detail";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam ("id") Long id) {
       boolean deleteResult = memberService.delete(id);
       if (deleteResult){
           //redirect: 컨트롤러의 메서드에서 다른 메서드의 주소를 호출
           //redirect 를 이용하여 findAll 주소 요청
           return "redirect:/findAll-form";
       } else {
           return "delete-fail";
       }
    }
    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model){
        // 로그인을 한 상태기 때문에 세션에 id, memberId 가 들어있고
        // 여기서 세션에 있는 id를 가져온다.
        Long updateId = (Long) session.getAttribute("loginId");
        System.out.println("updateId = " + updateId);
        // DB에서 해당 회원의 정보를 가져와서 그 정보를 가지고 update.jsp로 이동
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        boolean updateResult = memberService.update(memberDTO);
        System.out.println(updateResult);
        if(updateResult){
            System.out.println(memberDTO.getId());
            return "redirect:/detail?id=" + memberDTO.getId();
        } else {
            return "update-fail";
        }
    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        System.out.println("memberId= " + memberId);
        // memberId 를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴 받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        System.out.println(checkResult);
        return checkResult;
    }
    @GetMapping("/response-test")
    public @ResponseBody String responseTest() {
        return "main";
    }
    @GetMapping("/response-test2")
    public @ResponseBody List<MemberDTO> responseTest2() {
        return memberService.findAll();
    }
    @GetMapping("/detail-ajax")
    public @ResponseBody MemberDTO findById2 (@RequestParam ("id") Long id) {
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        return memberDTO;
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }
}
