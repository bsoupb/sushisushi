package com.bsoupb.sushisushi.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping("/review/review-view")
	public String review() {
		return "/review/review";
	}
	
}
