package com.bsoupb.sushisushi.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bsoupb.sushisushi.review.domain.Review;
import com.bsoupb.sushisushi.review.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/review")
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/create")
	public Map<String, String> createReview(
					@RequestParam("contents") String contents
					, @RequestParam(value="imagePath", required=false) MultipartFile imagePath
					, @RequestParam("point") double point
					, HttpSession session
					, Model model
											){
		
		int userId = (Integer)session.getAttribute("userId");
		
		model.addAttribute("review", "reviewList");
		
		Review review = reviewService.addReview(userId, contents, imagePath, point);
		
		Map<String, String> resultMap = new HashMap<>();

		if(review != null){
			resultMap.put("rusult", "success");
		} else{
			resultMap.put("result", "fail");
		}

		return resultMap;

	}
	
}
