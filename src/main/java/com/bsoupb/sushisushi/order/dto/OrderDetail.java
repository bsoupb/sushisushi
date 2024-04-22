package com.bsoupb.sushisushi.order.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OrderDetail {
	
	private int id;
	private int menuId;
	private int userId;
	private int count;
	
	private int billId;
	private int totalDish;
	
	private String name;
	private int price;
	private boolean isShoppingbasket;
	

}
