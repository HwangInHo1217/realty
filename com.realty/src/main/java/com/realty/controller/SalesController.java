package com.realty.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import dto.SalesRequestDTO;
import service.SalesService;

@Controller
public class SalesController {
	@Autowired
	private SalesService salesService;
	@GetMapping({"/","index.jsp","index"})
	public String weektails(@ModelAttribute ArrayList<SalesRequestDTO> allSales, Model model) {
		System.out.println("출력 확인 컨트롤러");
		allSales = salesService.findAllSales();
		model.addAttribute("sales", allSales);
		return "forward:/weekinfo.jsp";
	}
}
