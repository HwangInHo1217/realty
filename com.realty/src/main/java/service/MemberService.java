package service;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import dto.JoinRequestDTO;
import dto.MemberRequestDTO;
import model.Member;
import repository.MemberRepository;

@Service
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
    public void changeValueCkbox(JoinRequestDTO dto) {//반복문으로 모든 컬럼을 on인지 검수하는 방법도 생각했지만 다른 컬럼에 on 또는 off의 값이 들어갈수도 있으므로 조건문으로 컬럼 비교
    	if(dto.getM_pic().equals("on")) {
    		dto.setM_pic("Y");
    	}else {
    		dto.setM_pic("N");
    	}
    	if(dto.getAge_ck().equals("on")) {
    		dto.setAge_ck("Y");
    	}else {
    		dto.setAge_ck("N");
    	}
    	if(dto.getM_tos().equals("on")) {
    		dto.setM_tos("Y");
    	}else {
    		dto.setM_tos("N");
    	}
    	if(dto.getM_ms().equals("on")) {
    		dto.setM_ms("Y");
    	}else {
    		dto.setM_ms("N");
    	}
    }
    public void saveMember(JoinRequestDTO dto) {
    	changeValueCkbox(dto);
        memberRepository.saveMember(dto);
    }
    public boolean authenticate(MemberRequestDTO dto,HttpSession session) {
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
    public String searchEmail(MemberRequestDTO dto) {
    	System.out.println(dto.getM_tel());
    	Member member = memberRepository.findByMtel(dto);
    	if(member != null && member.getM_name().equals(dto.getM_name())&&member.getM_tel().equals(dto.getM_tel())) {
    		return member.getM_email();
    	}else {
    		return "error";
    	}
    }
    public boolean searchPass(MemberRequestDTO dto) {   	
    	try {
        	Member member = memberRepository.findByMemailAndMtel(dto);
        	dto.setM_pass(member.getM_pass());
        	if(member != null && member.getM_email().equals(dto.getM_email())){
        		return true;
        	}else {
        		return false;
        	}
			
		} catch (Exception e) {
			System.out.println("email 및 tel 조회시 예외 : "+ e.getMessage());
		}
    	return false;
    }
    public boolean updatePassowrd(MemberRequestDTO dto,String newPassword) {
    	try {
    		memberRepository.changePassword(dto);
    		Member member = memberRepository.findByEmail(dto);
    		System.out.println("member.getM_pass(): "+member.getM_pass());
    		System.out.println("newPassword:"+ newPassword);
    		if(member.getM_pass().equals(newPassword)) {
    			return true;	
    		}else {
    			return false;
    		}
		} catch (Exception e) {
			System.out.println("업데이트시 예외 : "+ e.getMessage());
			e.printStackTrace();
		}
    	return false;
    	
    }
    public void logout(HttpSession session) {
    	session.invalidate();
    }
    
}
