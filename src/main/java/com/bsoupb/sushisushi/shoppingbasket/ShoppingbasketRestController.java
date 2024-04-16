package com.bsoupb.sushisushi.shoppingbasket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;
import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/order")
public class ShoppingbasketRestController {

	@Autowired
	private ShoppingbasketService shoppingbasketService;
	
	@PostMapping("/basket")
	public Map<String, String> addBasket(
									@RequestParam("menuId") int menuId
									, HttpSession session
									){
		
		int userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
	
		Shoppingbasket shoppingbasket = shoppingbasketService.addBasket(menuId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(shoppingbasket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PostMapping("/plus")
	public Map<String, String> plusBasket(
			@RequestParam("menuId") int menuId
			, HttpSession session
			){
		
		int userId = (Integer)session.getAttribute("userId");
		
		Shoppingbasket shoppingbasket = shoppingbasketService.plusBasket(menuId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(shoppingbasket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@PostMapping("/minus")
	public Map<String, String> minusBasket(
			@RequestParam("menuId") int menuId
			, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		Shoppingbasket shoppingbasket = shoppingbasketService.minusBasket(menuId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(shoppingbasket != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}
