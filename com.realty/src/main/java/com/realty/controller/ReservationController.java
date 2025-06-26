package com.realty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.MemberRequestDTO;
import dto.ReservationRequestDTO;
import dto.SalesRequestDTO;
import repository.ReservationRespository;
import service.ReservationService;
import service.SalesService;

@Controller
public class ReservationController {
	@Autowired
	SalesService salesService;
	@Autowired
	ReservationService reservationService;
	@PostMapping("/reservation")
	public String reservation( @ModelAttribute ReservationRequestDTO dto) {
		System.out.println("reservation 포스트");
		System.out.println(dto.getR_date().toString());
		System.out.println(dto.getR_time().toString());
		reservationService.save(dto);
		//model.addAttribute("dto", dto);
		return "redirect:/index";
	}
	@GetMapping("/reservation")
	public String reservation(@RequestParam("id") int idx,Model model) {
		System.out.println(idx);
		SalesRequestDTO dto = salesService.getSalesDTO(idx);
		model.addAttribute("sale", dto);
		
		return "/reservation";
	}
	@GetMapping("/reservation/{id}")
	public String detailReservation(@PathVariable("id") int id, Model model) {
		ReservationRequestDTO dto=reservationService.getReservationDTO(id);
		model.addAttribute("dto", dto);
		return "/reservation_check";
	}
	@RequestMapping("/reservation-list")
	public String showReservations(Model model, @ModelAttribute MemberRequestDTO m_dto) {
	    String m_tel = m_dto.getM_tel(); // 전달받은 전화번호
	    List<ReservationRequestDTO> reservations = reservationService.getReservationsByTel(m_tel);
	    model.addAttribute("reservations", reservations);
	    return "/reservation_list";
	}
	@PostMapping("/reservation-cancel")
	public String cancelReservation(@RequestParam("reservation_idx") int reservation_idx,
	                                @RequestParam("m_tel") String m_tel,
	                                RedirectAttributes redirect) {
	    reservationService.cancelReservation(reservation_idx);
	    redirect.addFlashAttribute("success", "예약이 취소되었습니다.");
	    redirect.addFlashAttribute("m_tel", m_tel); // 취소 후 목록 재조회용
	    return "redirect:/reservation-list?m_tel=" + m_tel;
	}
}
