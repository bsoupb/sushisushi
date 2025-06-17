package com.bsoupb.sushisushi.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bsoupb.sushisushi.review.dto.ReviewDetail;
import com.bsoupb.sushisushi.review.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/review/review-view")
	public String review(
						HttpSession session
						, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<ReviewDetail> reviewList = reviewService.getReviewList(userId);
		
		model.addAttribute("reviewList", reviewList);
		
		return "/review/review";
	}
	
}
