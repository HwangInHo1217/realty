package model;

import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class Reservation {
    private int reservation_idx;      // reservation_idx
    private Integer sales_idx;        // sales_idx (nullable)
    private Integer m_idx;            // m_idx (nullable)
    private String s_name;            // s_name
    private Date r_date;              // r_date
    private Time r_time;              // r_time
    private String m_name;            // m_name
    private String s_visit_num;       // s_visitNum (enum '1명', '2명')
    private String m_tel;             // m_tel
    private LocalDateTime created_at;     // createdAt

}
