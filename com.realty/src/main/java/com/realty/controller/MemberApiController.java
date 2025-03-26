package com.realty.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.EmailSearchRequestDTO;
import dto.JoinRequestDTO;
import dto.LoginRequestDTO;
import dto.SearchPasswordRequestDTO;
import lombok.RequiredArgsConstructor;
import repository.MemberRepository;
import service.MemberService;

@Controller
public class MemberApiController {

	@Autowired
	private MemberService memberService;

	// @RequestParam :DTO에 없는 name을 처리할 때 주로 사용
	// defaultValue 속성 ㅣ null name값이 전송 되었을 경우 발동되는 속성
	// required(true) 필수로 무조건 name을 처리하게함
	// required(false) name 값을 front에서 보내지 않아도
	@PostMapping("/join")
	public String join(@ModelAttribute JoinRequestDTO dto,
			@RequestParam(defaultValue = "N", required = false) String m_ms) { // @ModelAttribute를 사용하여 폼 데이터를 DTO로 바인딩
		try {
			this.memberService.saveMember(dto);
		} catch (Exception e) {
			System.out.println("예외: " + e.getMessage());
		}

		System.out.println("진입");
		return "redirect:/login.jsp";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute LoginRequestDTO dto, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("login 진입");
		System.out.println("로그인 "+dto.getM_email());
		System.out.println("로그인 "+dto.getM_pass());
		if (memberService.authenticate(dto, session)) {
			System.out.println("리다이렉트 전");
			return "redirect:index.jsp";
		} else {
			System.out.println("else 분기");
			redirectAttributes.addFlashAttribute("error", "아이디와 비밀번호 재확인"); // FlashAttributes 사용
			return "redirect:login.jsp";
		}	
	}
	@PostMapping("/searchmail")
	public String searchmail(@ModelAttribute EmailSearchRequestDTO dto, Model model) {
		System.out.println("컨트롤러"+dto.getM_name());
		System.out.println("컨트롤러"+dto.getM_tel());
		System.out.println("진입");
		
		String mail=memberService.searchEmail(dto);
		System.out.println(mail);
		model.addAttribute("mail", mail);
		if(mail.equals("error")) {
			model.addAttribute(mail, "일치하는 회원이 없습니다.");
		}else {
			model.addAttribute(mail, mail);
		}
		return "redirect:search_myinfo.jsp";
		
	}
	@PostMapping("/searchPassword")
	public String searchPassword(@ModelAttribute SearchPasswordRequestDTO dto, Model model, HttpSession session) {
		if(memberService.searchPass(dto)) {
			session.setAttribute("dto", dto);
			return "redirect:search_mypass.jsp";
		}
		else {
			model.addAttribute("errpr","일치하지 않습니다.");
			return "redirect:passwd_search.jsp";
		}
	}
	@PutMapping("/changePassword")
	public ResponseEntity<String> changePassword(@RequestBody SearchPasswordRequestDTO dto) {
		if(memberService.updatePassowrd(dto, dto.getM_pass())) {
			 return ResponseEntity.ok("Password updated successfully");
		}else {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed to update password");

		}		
	}
	
}
