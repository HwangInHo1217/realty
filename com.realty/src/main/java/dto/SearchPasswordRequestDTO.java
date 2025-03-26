package dto;

import lombok.Data;

@Data
public class SearchPasswordRequestDTO {
	private String m_tel;
	private String m_email;
	private String m_pass;
}
