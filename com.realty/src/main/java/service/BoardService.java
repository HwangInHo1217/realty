package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.BoardRequestDTO;
import repository.BoardRepository;

@Service
public class BoardService {
 
	@Autowired
	BoardRepository boardRepository;
	
	public ArrayList<BoardRequestDTO> getAllBoard(){
		ArrayList<BoardRequestDTO> all=null;
		try {
			all= boardRepository.findAll();		
		} catch (Exception e) {
			System.out.println("boardFindAll예외:"+e.getMessage());
		}
		return all;
	}
	public BoardRequestDTO getBoard(int idx) {
		BoardRequestDTO dto=null;
		try {
			dto=boardRepository.findByIdx(idx);
					} catch (Exception e) {
			System.out.println("boardFindByIdx 예외:"+ e.getMessage());
		}
		return dto;
	}
	public void updateViewCnt(int idx) {
		try {
			boardRepository.updateViewCnt(idx);
		} catch (Exception e) {
			System.out.println("boardUpadteView예외:"+e.getMessage());
		}
	}
	public ArrayList<BoardRequestDTO> getSearchBoard(String searchText){
		ArrayList<BoardRequestDTO> dto=null;
		try {			
			dto=boardRepository.findByTitle(searchText);
		} catch (Exception e) {
			System.out.println("boardFindByTitle : 예외 :"+e.getMessage());
		}
		return dto;
	}
	public int countBoard() {
		int total=0;
		total=boardRepository.cntByBoard();
		return total;
	}
	public int addBoard(BoardRequestDTO dto) {
		try {			
			System.out.print("로깅 : "+dto.getB_img_url());
			boardRepository.saveBoard(dto);
			return 1;
		} catch (Exception e) {
			System.out.println("addBoard예외 :"+e.getMessage());
			
		}
		return 0;
	}
	public List<BoardRequestDTO> getRecentBoards() {
		return boardRepository.selectRecentBoards();
	}
}
