package com.realty.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.JoinRequestDTO;
import dto.MemberRequestDTO;
import service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// @RequestParam :DTO에 없는 name을 처리할 때 주로 사용
	// defaultValue 속성 ㅣ null name값이 전송 되었을 경우 발동되는 속성
	// required(true) 필수로 무조건 name을 처리하게함
	// required(false) name 값을 front에서 보내지 않아도
	@PostMapping("/join")
	public String join(@ModelAttribute JoinRequestDTO dto,
			@RequestParam(defaultValue = "N", required = false) String m_ms) { // @ModelAttribute를 사용하여 폼 데이터를 DTO로 바인딩
		System.out.println("join 접근 성공 getMapping");
		try {
			System.out.println("m_pic: "+dto.getM_pic());
			this.memberService.saveMember(dto);
		} catch (Exception e) {
			System.out.println("예외: " + e.getMessage());
		}

		System.out.println("진입");
		return "redirect:/login.jsp";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute MemberRequestDTO dto, HttpSession session, Model model) {
		System.out.println("login 진입");
		System.out.println("로그인 "+dto.getM_email());
		System.out.println("로그인 "+dto.getM_pass());
		if (memberService.authenticate(dto, session)) {
			System.out.println("리다이렉트 전");
			return "redirect:index.jsp";
		} else {
			System.out.println("else 분기");
			model.addAttribute("error", "아이디와 비밀번호 재확인"); 
			return "forward:/login.jsp";
		}	
	}
	@PostMapping("/searchmail")
	public String searchmail(@ModelAttribute MemberRequestDTO dto, Model model) {
	    System.out.println("컨트롤러: " + dto.getM_name());
	    System.out.println("컨트롤러: " + dto.getM_tel());
	    System.out.println("진입");

	    String mail = memberService.searchEmail(dto);

	    if(mail.equals("error")) {
	        model.addAttribute("error", "이메일을 찾을 수 없습니다.");
	    } else {
	        model.addAttribute("mail", mail);
	    }

	    // forward 방식으로 JSP로 이동
	    return "forward:/search_myinfo.jsp";
	}

		
	
	@PostMapping("/searchPassword")
	public String searchPassword(@ModelAttribute MemberRequestDTO dto, Model model, HttpSession session) {
		if(memberService.searchPass(dto)) {
			session.setAttribute("dto", dto);
			return "redirect:search_mypass.jsp";
		}
		else {
			model.addAttribute("error","일치하지 않습니다.");
			return "redirect:passwd_search.jsp";
		}
	}
	@PostMapping("/changePassword")
	public String changePassword(@ModelAttribute MemberRequestDTO dto, Model model) {
		System.out.println("dto값 확인 ");
		System.out.println(dto);
		System.out.println("진입");
		if(memberService.updatePassowrd(dto, dto.getM_pass())){
			return "redirect:login.jsp";
		}
		else{
			model.addAttribute("error", "비밀번호 변경 실패");
			return "redirect:index.jsp";
		}
	}
	@PostMapping("/requestCounsel")
	public String requestCounsel(@ModelAttribute MemberRequestDTO dto, HttpSession session) {
		session.setAttribute("dto", dto);
		System.out.println("counsel:"+dto.getM_tel());
		return "redirect:counsel.jsp";
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "redirect:index.jsp";
	}
}
