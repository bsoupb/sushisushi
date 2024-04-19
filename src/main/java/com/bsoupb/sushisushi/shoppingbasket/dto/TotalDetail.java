package com.bsoupb.sushisushi.shoppingbasket.dto;

import java.util.List;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class TotalDetail {

	private int price;
	
	private int count;
	
	private List<ShoppingbasketDetail> shoppingbasketDetailList;
	
}
