package com.bsoupb.sushisushi.review.dto;

import java.util.Date;


import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class ReviewDetail {

	private String loginId;
	
	private int reviewId;
	private int userId;
	private String contents;
	private String imagePath;
	private double point;
	private Date createdAt;
	private Date updatedAt;
	
}
