package com.bsoupb.sushisushi.bill;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bsoupb.sushisushi.bill.domain.Bill;
import com.bsoupb.sushisushi.bill.service.BillService;
import com.bsoupb.sushisushi.order.service.OrderDtoService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BillController {

	@Autowired
	private OrderDtoService orderdtoService;
	
	@Autowired
	private BillService billService;
	
	/*
	@GetMapping("/bill/receipt-view")
	public String receipt(
			HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> orderDetailMap = orderService.getOrderList(userId);
		
		model.addAttribute("orderDetailMap", orderDetailMap);
		
		return "bill/receipt";
	}
	*/
	
	@GetMapping("/bill/orderdetail-view")
	public String orderDetail(
			HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Bill> billList = billService.getBillListByUserId(userId);
		
		model.addAttribute("billList", billList);
		
		return "/bill/orderdetail";
	}

	@GetMapping("/bill/receipt-view")
	public String OrderDetail(
			@RequestParam("billId") int billId
			, Model model
			) {
		
		Map<String, Object> orderListMap = orderdtoService.getOrderList(billId);

		model.addAttribute("orderListMap", orderListMap);
		
		return "bill/receipt";
	}
	
}
