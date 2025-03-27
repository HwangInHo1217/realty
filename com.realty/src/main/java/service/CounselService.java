package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.SaveCounselRequestDTO;
import repository.CounselRepository;

@Service
public class CounselService {
	@Autowired
	private CounselRepository counselRepository;
	
	public void save(SaveCounselRequestDTO dto) {
		try {
			counselRepository.saveCounsel(dto);		
		} catch (Exception e) {
			System.out.println("counsel 저장 중 예외: "+e.getMessage());
			
		} 
	}
	
}
