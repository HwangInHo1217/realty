package model;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class Counsel {
	private int counsel_idx;
	private String m_name;
	private String m_email;
	private String m_tel;
	private String c_rental;
	private String c_type;
	private Date counselDate;
	private String c_content;
	private LocalDateTime createdAt;
}
