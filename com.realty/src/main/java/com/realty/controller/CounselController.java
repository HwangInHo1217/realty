package com.realty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import dto.SaveCounselRequestDTO;
import service.CounselService;

@Controller
public class CounselController {
	
	@Autowired
	private CounselService counselService;
	@PostMapping("/addCounsel")
	public String addCounsel(@ModelAttribute SaveCounselRequestDTO dto)
	{
	
		System.out.println(dto.getC_content());
		counselService.save(dto);
		return "redirect:/index";
	}
	

	

}
