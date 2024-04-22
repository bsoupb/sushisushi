package com.bsoupb.sushisushi.bill;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BillController {

	@Autowired
	private ShoppingbasketService shoppingbasketService;
	
	@GetMapping("/bill/receipt-view")
	public String receipt(
			HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> shoppingbasketDetailMap = shoppingbasketService.getShoppingbasketList(userId);
		
		model.addAttribute("shoppingbasketDetailMap", shoppingbasketDetailMap);
		
		return "bill/receipt";
	}
	
}
