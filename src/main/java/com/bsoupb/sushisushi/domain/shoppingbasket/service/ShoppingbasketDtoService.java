package com.bsoupb.sushisushi.shoppingbasket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;
import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;
import com.bsoupb.sushisushi.shoppingbasket.dto.ShoppingbasketDetail;
import com.bsoupb.sushisushi.shoppingbasket.repository.ShoppingbasketRepository;

@Service
public class ShoppingbasketDtoService {

	@Autowired
	private ShoppingbasketRepository shoppingbasketRepository;
	
	@Autowired
	private MenuService menuService;
	
	public Map<String, Object> getShoppingbasketList(int userId){
		
		List<Shoppingbasket> shoppingbasketList = shoppingbasketRepository.findByUserId(userId);
		
		List<ShoppingbasketDetail> shoppingbasketDetailList = new ArrayList<>();
		
		int totalPrice = 0;
		int totalCount = 0;
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			 
			int menuId = shoppingbasket.getMenuId();
			Optional<Menu> optionalMenu = menuService.getMenuByMenuId(menuId);
			Menu menu = optionalMenu.orElse(null);
			
			int count = shoppingbasket.getCount();
			int price = menu.getPrice();
			
			ShoppingbasketDetail shoppingbasketDetail = ShoppingbasketDetail.builder()
																			.id(shoppingbasket.getId())
																			.menuId(shoppingbasket.getMenuId())
																			.userId(shoppingbasket.getUserId())
																			.count(shoppingbasket.getCount())
																			.name(menu.getName())
																			.price(menu.getPrice())
																			.build();
			
			totalCount += count;
			totalPrice += price * count;
			
			
			shoppingbasketDetailList.add(shoppingbasketDetail);
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("totalCount", totalCount);
		resultMap.put("totalPrice", totalPrice);
		resultMap.put("ShoppingbasketDetail", shoppingbasketDetailList);
		
		return resultMap;
	}
	
}
