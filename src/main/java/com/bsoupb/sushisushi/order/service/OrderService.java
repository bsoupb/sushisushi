package com.bsoupb.sushisushi.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.order.domain.Order;
import com.bsoupb.sushisushi.order.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	public List<Order> getOrderList(){
		List<Order> orderList = orderRepository.findAllByOrderByIdDesc();
		return orderList;
	}
	
	
}
