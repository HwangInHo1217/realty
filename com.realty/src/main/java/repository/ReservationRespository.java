package repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dto.ReservationRequestDTO;
import dto.SalesRequestDTO;

@Mapper
public interface ReservationRespository {
	
	public void saveReservation(ReservationRequestDTO dto);
	public ReservationRequestDTO findBySidx(SalesRequestDTO s_dto);
	public ReservationRequestDTO findByIdx(int idx);

    List<ReservationRequestDTO> findByTel(String m_tel);
    void deleteByIdx(int reservation_idx);
}
