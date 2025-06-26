package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.ReservationRequestDTO;
import dto.SalesRequestDTO;
import repository.ReservationRespository;

@Service
public class ReservationService {
	
	@Autowired
	ReservationRespository reservationRespository;
	
	public void save(ReservationRequestDTO dto) {
		try {
			reservationRespository.saveReservation(dto);
		} catch (Exception e) {
			System.out.println("reservation 저장 중 예외"+ e.getMessage());
			e.printStackTrace();
		}
	}
	public ReservationRequestDTO verifyMember(SalesRequestDTO s_dto) {
		ReservationRequestDTO r_dto=null;
		try {
			r_dto=reservationRespository.findBySidx(s_dto);
			
		} catch (Exception e) {
			System.out.println("findBySidx예외: "+e.getMessage());
			e.printStackTrace();
		}
		return r_dto;			
	}
	public ReservationRequestDTO getReservationDTO(int idx) {
		ReservationRequestDTO dto=null;
		try {
			dto=reservationRespository.findByIdx(idx);
			
		} catch (Exception e) {
			System.out.println("reservation의findByIdx 중 예외" + e.getMessage());
			e.printStackTrace();
		}
		
		return dto; 
	}
	public List<ReservationRequestDTO> getReservationsByTel(String m_tel) {
	    try {
	        return reservationRespository.findByTel(m_tel);
	    } catch (Exception e) {
	        System.out.println("getReservationsByTel 예외: " + e.getMessage());
	        e.printStackTrace();
	        return new ArrayList<>();
	    }
	}
	public void cancelReservation(int reservation_idx) {
	    try {
	        reservationRespository.deleteByIdx(reservation_idx);
	    } catch (Exception e) {
	        System.out.println("예약 취소 예외: " + e.getMessage());
	        e.printStackTrace();
	    }
	}
	
}
