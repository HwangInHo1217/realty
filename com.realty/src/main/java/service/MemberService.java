package service;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import dto.EmailSearchRequestDTO;
import dto.JoinRequestDTO;
import dto.LoginRequestDTO;
import dto.SearchPasswordRequestDTO;
import model.Member;
import repository.MemberRepository;

@Service
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public void saveMember(JoinRequestDTO dto) {
        memberRepository.saveMember(dto);
    }
    public boolean authenticate(LoginRequestDTO dto,HttpSession session) {
    	Member member = memberRepository.findByEmail(dto);
    	System.out.println("쿼리 발동 후 ");
    	if(member != null && member.getM_pass().equals(dto.getM_pass())) {
    		System.out.println("세션 설정 전");
    		session.setAttribute("member", member);
    		System.out.println("세션 설정 후");
    		return true;
    	}
    	else
    		return false;
    }
    public String searchEmail(EmailSearchRequestDTO dto) {
    	System.out.println(dto.getM_tel());
    	Member member = memberRepository.findByMtel(dto);
    	if(member != null && member.getM_name().equals(dto.getM_name())&&member.getM_tel().equals(dto.getM_tel())) {
    		return member.getM_email();
    	}else {
    		return "error";
    	}
    }
    public boolean searchPass(SearchPasswordRequestDTO dto) {
    	Member member = memberRepository.findByMemailAndMtel(dto);
    	dto.setM_pass(member.getM_pass());
    	if(member != null && member.getM_email().equals(dto.getM_email())){
    		return true;
    	}else {
    		return false;
    	}
    }
    public boolean updatePassowrd(SearchPasswordRequestDTO dto,String newPassword) {
    	memberRepository.changePassword(dto);
    	Member member = memberRepository.findByMemailAndMtel(dto);
    	if(member.getM_pass().equals(newPassword)) {
    		return true;	
    	}else {
    		return false;
    	}
    	
    	
    }
    public void logout(HttpSession session) {
    	session.invalidate();
    }
    
}
