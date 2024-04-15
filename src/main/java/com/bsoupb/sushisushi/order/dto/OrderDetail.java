package com.bsoupb.sushisushi.order.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OrderDetail {
	
	private int menuId;
	private int userId;
	private int orderId;
	private int totalDish;
	
	private String name;
	private boolean isShoppingbasket;
	

}
