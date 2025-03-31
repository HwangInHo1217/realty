package com.realty.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import dto.SalesRequestDTO;
import service.SalesService;

@Controller
public class SalesController {
	@Autowired
	private SalesService salesService;
	@GetMapping({"/","index","/com.realty"})
	public String weektails(@ModelAttribute ArrayList<SalesRequestDTO> allSales, Model model) {
		System.out.println("출력 확인 컨트롤러");
		allSales = salesService.findAllSales();
		model.addAttribute("sales", allSales);
		System.out.println("controller에서 잘 넘어감");
		return "/index";
	}
	
	@GetMapping("/sale-detail/{id}")
	public String detailSale(@PathVariable int id, Model model) {
		System.out.println("asd");
		SalesRequestDTO dto = salesService.getSalesDTO(id);
		model.addAttribute("sale", dto);
		return "forward:/week_tails.jsp";
	}
	
	@PostMapping("/reservation")
	public String reservation(@ModelAttribute SalesRequestDTO dto,Model model) {
		System.out.println("dto"+dto.getS_name());
		model.addAttribute("sale", dto);
		
		return "/reservation";
	}
	
}
