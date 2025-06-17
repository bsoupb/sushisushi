package com.bsoupb.sushisushi.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main/main-view")
	public String main() {
		return "/main/main";
	}
	
}
