package com.bsoupb.sushisushi.menu;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/menu")
public class MunuRestController {

	@Autowired
	private MenuService menuService;

	@PostMapping("/create")
	public Map<String, String> addMenuList(
								@RequestParam("imagePath") MultipartFile imagePath
								, @RequestParam("name") String name
								, @RequestParam("type") String type
								, @RequestParam("price") int price
								, @RequestParam("dishColor") String dishColor
								, HttpSession session
											){
		
		int userId = (Integer)session.getAttribute("userId");
		
		Menu menu = menuService.addMenu(userId, imagePath, name, type, price, dishColor);

		Map<String, String> resultMap = new HashMap<>();

		if(menu != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		} 
		
		return resultMap;

	}
	
	@PostMapping("/update")
	public Map<String, String> updateMenuList(
								@RequestParam("id") int id
								, @RequestParam("name") String name
								, @RequestParam("type") String type
								, @RequestParam("price") int price
								, @RequestParam("dishColor") String color
								, HttpSession session
											){
		
		int userId = (Integer)session.getAttribute("userId");

		Menu menu = menuService.updateMenu(id, userId, name, type, price, color);

		Map<String, String> resultMap = new HashMap<>();

		if(menu != null){
			resultMap.put("result", "success");
		} else{
			resultMap.put("result", "fail");
		}

		return resultMap;

	}
	
	
	
}
