package com.bsoupb.sushisushi.soldout;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/soldout")
public class SoldoutRestController {

	@PostMapping("/soldout")
	public Map<String, String> soldout(@RequestParam("id") int id) {
		
	}
	
}
