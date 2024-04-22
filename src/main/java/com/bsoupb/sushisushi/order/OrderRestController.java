package com.bsoupb.sushisushi.order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.sushisushi.bill.domain.Bill;
import com.bsoupb.sushisushi.order.service.OrderService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/order")
public class OrderRestController {

	@Autowired
	private OrderService orderService;
	
	@PostMapping("/insert")
	public Map<String, String> saveOrder(
			@RequestParam("address") String address 
			, HttpSession session
			){
		
		int userId = (Integer)session.getAttribute("userId");
		
		Bill bill = orderService.insertOrder(userId, address);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(bill != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	/*
	@PostMapping("/reserved")
	public Map<String, String> reservedNumber(HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		Bill bill = orderService.reservedNumber(userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(bill != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	*/
	
}
