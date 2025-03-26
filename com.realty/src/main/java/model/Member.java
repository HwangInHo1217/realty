package model;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Member {
	private Long m_idx;
	private String m_email;
	private String m_pass;
	private String m_name;
	private String m_tel;
	private String age_ck;
	private String m_tos;
	private String m_pic;
	private String m_ms;
	private LocalDateTime createdat;
}
