package repository;



import org.apache.ibatis.annotations.Mapper;

import dto.JoinRequestDTO;
import dto.MemberRequestDTO;
import model.Member;

@Mapper
public interface MemberRepository {
	public void saveMember(JoinRequestDTO dto);
	public Member findByEmail(MemberRequestDTO dto);
	public Member findByMtel(MemberRequestDTO dto);
	public Member findByMemailAndMtel(MemberRequestDTO dto);
	public void changePassword(MemberRequestDTO dto);
}
