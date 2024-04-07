package com.bsoupb.sushisushi.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bsoupb.sushisushi.common.FileManager;
import com.bsoupb.sushisushi.review.domain.Review;
import com.bsoupb.sushisushi.review.repository.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	public Review addReview(int userId, String contents, MultipartFile file, double point){
		
		String filePath = FileManager.saveFile(userId, file);

		Review review = Review.builder()
								.userId(userId)
								.contents(contents)
								.imagePath(filePath)
								.point(point)
								.build();
		
		return reviewRepository.save(review);

	}

	
	
}
