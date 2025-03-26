package repository;



import org.apache.ibatis.annotations.Mapper;

import dto.ChangePasswordRequestDTO;
import dto.EmailSearchRequestDTO;
import dto.JoinRequestDTO;
import dto.LoginRequestDTO;
import dto.SearchPasswordRequestDTO;
import model.Member;

@Mapper
public interface MemberRepository {
	public void saveMember(JoinRequestDTO dto);
	public Member findByEmail(LoginRequestDTO dto);
	public Member findByMtel(EmailSearchRequestDTO dto);
	public Member findByMemailAndMtel(SearchPasswordRequestDTO dto);
	public void changePassword(SearchPasswordRequestDTO dto);
}
