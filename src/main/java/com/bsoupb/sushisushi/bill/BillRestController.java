package com.bsoupb.sushisushi.bill;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.sushisushi.order.domain.Order;
import com.bsoupb.sushisushi.order.service.OrderService;

@RequestMapping("/bill")
@RestController
public class BillRestController {

	@Autowired
	private OrderService orderService;
	
	public Map<String, Object> OrderDetail(
			@RequestParam("billId") int billId
			, Model model
			) {
		
		Map<String, Object> orderListMap = orderService.getOrderList(billId);

		for()
		
		
	}
	
}
