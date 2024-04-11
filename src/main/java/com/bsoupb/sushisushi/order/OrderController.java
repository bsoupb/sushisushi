package com.bsoupb.sushisushi.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private MenuService menuService;
	
	@GetMapping("/basket-view")
	public String shoppingBasket(
			@RequestParam("type") String type
			, HttpSession session
			, Model model
			) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Menu> menuList = menuService.getMenuList(type);
		
		model.addAttribute("menuList", menuList);
		
		
		return "/order/basket";
	}
	
	@GetMapping("/order-list-view")
	public String orderList() {
		return "/order/orderlist";
	}
	
}
