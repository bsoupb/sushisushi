package com.bsoupb.sushisushi.shoppingbasket.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ShoppingbasketDetail {

	private int id;
	private int menuId;
	private int userId;
	private int count;
	
	private String name;
	private int price;
	
}
