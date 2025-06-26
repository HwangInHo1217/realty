package dto;

import lombok.Data;

@Data
public class BoardRequestDTO {
	private int board_idx;
	private String b_title;
	private String b_writer;
	private String b_date;
	private int b_view_cnt;
	private String b_content;
	private String b_img_url;
}
