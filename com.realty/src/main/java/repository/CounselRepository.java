package repository;

import org.apache.ibatis.annotations.Mapper;

import dto.SaveCounselRequestDTO;

@Mapper
public interface CounselRepository {
	public void saveCounsel(SaveCounselRequestDTO dto);	 
}
