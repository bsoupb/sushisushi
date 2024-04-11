package com.bsoupb.sushisushi.menu;

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
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/list-view")
	public String menuList(
			@RequestParam(value="type", required=false) String type
			, HttpSession session
			, Model model) {
		
		int userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		if(type == null) {
			type = "초밥";
		}
		
		List<Menu> menuList = menuService.getMenuList(type);
		
		model.addAttribute("menuList", menuList);
		
		return "/menu/list";
	}
	
	@GetMapping("/list-add-view")
	public String menuAddList() {
		return "/menu/addlist";
	}
	
	@GetMapping("/list-update-view")
	public String menuUpdateList(
						@RequestParam("id") int id
						, Model model
								) {

		Menu menu = menuService.getMenu(id);
		
		model.addAttribute("menu", menu);
		
		return "/menu/updatelist";
	}
}
