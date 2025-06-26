package com.realty.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.BoardRequestDTO;
import service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/board-list")
	public String board_list(ArrayList<BoardRequestDTO> al, Model model,
			@RequestParam(defaultValue = "", required = false) String searchText,
			@RequestParam(defaultValue="1", required=false) int pageno) {
		int total=boardService.countBoard();
		int userpage=0;
		if(pageno==1) {
			userpage=0;
		}else {
			userpage=(pageno-1)*10;
		}
		if (!searchText.equals("")) {
			al = boardService.getSearchBoard(searchText);
		} else {
			al = boardService.getAllBoard();
		}
		model.addAttribute("boards", al);
		model.addAttribute("total", total);
		model.addAttribute("userpage", userpage);
		return "/md_board";
	}

	@GetMapping("/board/{idx}")
	public String boardDetail(@PathVariable int idx, Model model) {
		BoardRequestDTO dto = boardService.getBoard(idx);
		boardService.updateViewCnt(idx);
		model.addAttribute("board", dto);
		return "/md_board_view";
	}
	@PostMapping("/board")
	public String saveBoard(@ModelAttribute BoardRequestDTO dto,
	                        @RequestParam("b_image_url") MultipartFile file,
	                        HttpServletRequest request,
	                        Model model) {
		// 업로드된 파일명을 저장할 변수
		String filePath = null;

		try {
			// 파일이 첨부된 경우
			if (!file.isEmpty()) {
				// 실제 파일 저장 경로
				String uploadDir = request.getServletContext().getRealPath("/upload/");
				System.out.println("Upload Directory: " + uploadDir);
				// upload 디렉토리가 존재하지 않으면 생성
				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs(); // 폴더 없으면 생성
				}

				// 파일명 중복 방지 - 시간 기반 변경
				String originalFileName = file.getOriginalFilename();
				String newFileName = System.currentTimeMillis() + "_" + originalFileName;

				// 파일 저장
				File saveFile = new File(uploadDir + newFileName);
				FileCopyUtils.copy(file.getBytes(), saveFile);

				// DB에 저장할 경로
				filePath = "/upload/" + newFileName;
				dto.setB_img_url(filePath); // DTO에 경로 저장
			}
			
			// 게시물 저장
			int result = boardService.addBoard(dto); // mapper에서 b_date는 CURRENT_DATE로 처리

			if (result > 0) {
				model.addAttribute("success", "정상적으로 저장되었습니다.");
			} else {
				model.addAttribute("error", "게시물 저장 실패");
			}

		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("error", "파일 업로드 중 오류 발생");
		}

		// 결과 페이지로 이동
		return "/md_board";
	}
	
	@GetMapping("/home")
	public String homePage(Model model) {
		List<BoardRequestDTO> recentBoards = boardService.getRecentBoards();
		model.addAttribute("recentBoards", recentBoards);
		return "/home"; // home.jsp
	}
}
