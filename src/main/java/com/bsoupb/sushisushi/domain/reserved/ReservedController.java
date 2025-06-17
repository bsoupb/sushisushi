package com.bsoupb.sushisushi.reserved;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserved")
public class ReservedController {

	@GetMapping("/reservation-add-view")
	public String addReserved() {
		return "/reserved/addreserved";
	}
	
	
}
