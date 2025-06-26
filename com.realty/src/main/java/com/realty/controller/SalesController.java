package com.realty.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.BoardRequestDTO;
import dto.ReservationRequestDTO;
import dto.SalesRequestDTO;
import service.BoardService;
import service.ReservationService;
import service.SalesService;

@Controller
public class SalesController {
	@Autowired
	private SalesService salesService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private BoardService boardService;
	@GetMapping({"/","index"})
	public String weektails(@ModelAttribute ArrayList<SalesRequestDTO> allSales, Model model) {
		System.out.println("출력 확인 컨트롤러");
		allSales = salesService.findAllSales();
		model.addAttribute("sales", allSales);
		System.out.println("controller에서 잘 넘어감");
		List<BoardRequestDTO> recentBoards = boardService.getRecentBoards();
		model.addAttribute("recentBoards", recentBoards);
		return "/main";
	}
	
	@GetMapping("/sale-detail/{id}")
	public String detailSale(@PathVariable int id, Model model) {
		System.out.println("asd");
		ReservationRequestDTO reservationRequestDTO=null;
		SalesRequestDTO dto = salesService.getSalesDTO(id);
		try {
			reservationRequestDTO = reservationService.verifyMember(dto);
			model.addAttribute("r_dto", reservationRequestDTO);
		} catch (Exception e) {
			System.out.println("detailSaleController 예와"+e.getMessage());
		}
		model.addAttribute("sale", dto);
		return "forward:/week_tails.jsp";
	}
	

	
}
