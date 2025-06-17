package com.bsoupb.sushisushi.review.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bsoupb.sushisushi.common.FileManager;
import com.bsoupb.sushisushi.review.domain.Review;
import com.bsoupb.sushisushi.review.dto.ReviewDetail;
import com.bsoupb.sushisushi.review.repository.ReviewRepository;
import com.bsoupb.sushisushi.user.domain.User;
import com.bsoupb.sushisushi.user.service.UserService;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private UserService userService;

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
	
	public List<ReviewDetail> getReviewList(int userId){
		
		List<Review> reviewList = reviewRepository.findAllByOrderByIdDesc();
		
		List<ReviewDetail> reviewDetailList = new ArrayList<>();
		
		for(Review review:reviewList) {
			
			int reviewUserId = review.getUserId();
			User user = userService.getUserById(reviewUserId);
			
			ReviewDetail reviewDetail = ReviewDetail.builder()
													.reviewId(review.getId())
													.userId(userId)
													.loginId(user.getLoginId())
													.contents(review.getContents())
													.point(review.getPoint())
													.imagePath(review.getImagePath())
													.build();
			
			reviewDetailList.add(reviewDetail);
			
		}
		
		return reviewDetailList;
		
		
		
	}
	
	public Review updateReview(int id, String contents, double point){
		
		Optional<Review> OptionalReview = reviewRepository.findById(id);
		Review review = OptionalReview.orElse(null);

		if(review != null){
			
			review = review.builder()
							.contents(contents)
							.point(point)
							.build();

			review = reviewRepository.save(review);
		}

		return review;

	}
	
	public Review deleteReview(int id){
		
		Optional<Review> OptionalReview = reviewRepository.findById(id);
		Review review = OptionalReview.orElse(null);
		
		if(review != null){
		
			FileManager.removeFile(review.getImagePath());
			reviewRepository.delete(review);
		}

		return review;

	}
}
