package repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dto.BoardRequestDTO;

@Mapper
public interface BoardRepository {
	
	public ArrayList<BoardRequestDTO> findAll();
	public BoardRequestDTO findByIdx(int idx);//;
	public void updateViewCnt(int idx);
	public ArrayList<BoardRequestDTO> findByTitle(String searchText);
	public int cntByBoard();
	public void saveBoard(BoardRequestDTO dto);
	public List<BoardRequestDTO> selectRecentBoards();
}
