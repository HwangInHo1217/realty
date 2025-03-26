package dto;

import lombok.Data;

@Data
public class ChangePasswordRequestDTO {
	private String m_pass;
	private String m_email;
}
