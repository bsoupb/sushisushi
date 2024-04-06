package com.bsoupb.sushisushi.bill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BillController {

	@GetMapping("/bill/receipt-view")
	public String receipt() {
		return "bill/receipt";
	}
	
}
