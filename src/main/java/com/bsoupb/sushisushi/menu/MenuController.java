package com.bsoupb.sushisushi.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/list-view")
	public String menuList(
			HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		List<Menu> menuList = menuService.getMenuList();
		
		model.addAttribute("menuList", menuList);
		
		return "/menu/list";
	}
	
	@GetMapping("/list-add-view")
	public String menuAddList() {
		return "/menu/addlist";
	}
	
	@GetMapping("/list-update-view")
	public String menuUpdateList() {
		return "/menu/updatelist";
	}
}
