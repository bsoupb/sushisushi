package com.bsoupb.sushisushi.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

	@GetMapping("/basket-view")
	public String shoppingBasket() {
		return "/order/basket";
	}
	
	@GetMapping("/order-list-view")
	public String orderList() {
		return "/order/orderlist";
	}
	
}
