package dto;

import lombok.Data;

@Data
public class MemberRequestDTO {
	private String m_pass;
	private String m_email;
	private String m_name;
	private String m_tel;

}
