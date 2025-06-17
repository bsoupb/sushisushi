package com.bsoupb.sushisushi.menu.dto;

import lombok.Builder;
import lombok.Getter;


@Getter
@Builder
public class MenuDetail {

	private int id;

	private String imagePath;
	
	private String name;
	private String type;
	private int price;

	private String dishColor;
	
	private Boolean isSoldout;
	
}
