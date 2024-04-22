package com.bsoupb.sushisushi.order.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.order.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

	public List<Order> findAllByOrderByIdDesc();
	
	public List<Order> findByUserId(int userId);
	
}
