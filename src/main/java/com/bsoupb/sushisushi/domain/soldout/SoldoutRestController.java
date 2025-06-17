package com.bsoupb.sushisushi.soldout;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.sushisushi.soldout.domain.Soldout;
import com.bsoupb.sushisushi.soldout.service.SoldoutService;

@RestController
@RequestMapping("/soldout")
public class SoldoutRestController {

	@Autowired
	private SoldoutService soldoutService;
	
	
	@PostMapping("/create")
	public Map<String, String> soldoutAdd(@RequestParam("menuId") int menuId) {
		
		Soldout soldout = soldoutService.addSoldoutMenu(menuId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(soldout != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
		
	}
	
	@DeleteMapping("/delete")
	public Map<String, String> soldoutDelete(@RequestParam("menuId") int menuId){
		
		Soldout soldout = soldoutService.deleteSoldoutMenu(menuId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(soldout != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}
