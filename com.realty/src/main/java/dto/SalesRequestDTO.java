package dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class SalesRequestDTO {
		private int sales_idx;          // auto_increment 기본키
	    private String s_name;          // 아파트명
	    private String s_addr;          // 주소
	    private String s_tpye;          // 종류 (아파트)
	    private String s_let;           // 임대형태
	    private String s_Bdate;         // 분양일자
	    private String s_Adate;         // 입주일자
	    private String s_file_ori;      // 원본 이미지 파일명
	    
	    
	    
	    private String s_heatStruct;    // 난방 구조
	    private String s_total;         // 세대 수
	    private String s_part;          // 개동
	    private String s_corp;          // 건설사
	    private String s_status;        // 현황 ('오픈' 또는 '접수')
	    
}
