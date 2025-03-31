package repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dto.SalesRequestDTO;
import model.Sales;

@Mapper
public interface SalesRepository {
	public ArrayList<SalesRequestDTO> findAll();
	public SalesRequestDTO findById(int idx);
}
