package dto;

import lombok.Data;

@Data
public class ReservationRequestDTO {
	
    private int reservation_idx;      // reservation_idx
    private int sales_idx;        // sales_idx (nullable)
    private int m_idx;            // m_idx (nullable)
    private String s_name;            // s_name
    private String r_date;              // r_date
    private String r_time;              // r_time
    private String m_name;            // m_name
    private String r_visitNum;       // s_visitNum (enum '1명', '2명')
    private String m_tel;             // m_tel

}
