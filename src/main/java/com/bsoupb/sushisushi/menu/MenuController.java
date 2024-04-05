package com.bsoupb.sushisushi.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/list-view")
	public String menuList() {
		return "/menu/list";
	}
	
	@GetMapping("/add-list-view")
	public String menuAddList() {
		return "/menu/addlist";
	}
	
	@GetMapping("/update-list-view")
	public String menuUpdateList() {
		return "/menu/updatelist";
	}
}
