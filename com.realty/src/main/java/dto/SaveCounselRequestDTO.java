package dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SaveCounselRequestDTO {
	private String m_email;
	private String m_name;
	private String m_tel;
	private String c_type;
	private String c_rental;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date counselDate;
	private String c_content;
}
