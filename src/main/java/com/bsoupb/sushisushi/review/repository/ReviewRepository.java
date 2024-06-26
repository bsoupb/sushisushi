package com.bsoupb.sushisushi.review.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.review.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

	// order by `id`
	public List<Review> findAllByOrderByIdDesc();
	
}
