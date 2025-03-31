package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.SalesRequestDTO;
import repository.SalesRepository;

@Service
public class SalesService {
	@Autowired
	private SalesRepository salesRepository; 
	
	public ArrayList<SalesRequestDTO> findAllSales(){
		System.out.println("출력확인 서비스단");
		ArrayList<SalesRequestDTO> result=null;
		try {
			result= salesRepository.findAll();
	
		} catch (Exception e) {
			System.out.println("slaes findAll 예외:"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	public SalesRequestDTO getSalesDTO(int idx) {
		SalesRequestDTO dto=null;
		try {
			dto= salesRepository.findById(idx);
			
		} catch (Exception e) {
			System.out.println("findbyid 예외"+ e.getMessage());
		}
		
		return dto;
	}
}
