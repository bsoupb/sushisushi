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
public class ShoppingbasketService {

	@Autowired
	private ShoppingbasketRepository shoppingbasketRepository;
	

	
	public Shoppingbasket addBasket(int menuId, int userId) {
		
		Shoppingbasket shoppingbasket = shoppingbasketRepository.findByMenuIdAndUserId(menuId, userId);
		
		if(shoppingbasket != null) {

			shoppingbasket = shoppingbasket.toBuilder()
					.count(shoppingbasket.getCount() + 1)
					.build();
			
		} else {
			
			shoppingbasket = Shoppingbasket.builder()
					.userId(userId)
					.menuId(menuId)
					.count(1)
					.build();
			
		}
		
		return shoppingbasketRepository.save(shoppingbasket);
		
	}
	
	public boolean isShoppingbasket(int menuId, int userId) {
		
		int count = shoppingbasketRepository.countByMenuIdAndUserId(menuId, userId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public int getShoppingbasketCount(int menuId) {
		return shoppingbasketRepository.countByMenuId(menuId);
	}
	
	public Shoppingbasket getMenuById(int menuId) {
		return shoppingbasketRepository.findBymenuId(menuId);
	}
	
	public List<Shoppingbasket> getShoppingbasketListByUserId(int userId) {
		
		List<Shoppingbasket> shoppingbasketList = shoppingbasketRepository.findByUserId(userId);
		return shoppingbasketList;
		
	}
	
	/*
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
	*/
	
	public Shoppingbasket plusBasket(int menuId, int userId) {
		
		Shoppingbasket shoppingbasket = shoppingbasketRepository.findByMenuIdAndUserId(menuId, userId);
		
		shoppingbasket = shoppingbasket.toBuilder()
										.count(shoppingbasket.getCount() + 1)
										.build();
	
		return shoppingbasketRepository.save(shoppingbasket);
		
	}
	
	public Shoppingbasket minusBasket(int menuId, int userId) {
		
		Shoppingbasket shoppingbasket = shoppingbasketRepository.findByMenuIdAndUserId(menuId, userId);
		
		int count = shoppingbasket.getCount();
		
		if(count <= 1) {
			
			shoppingbasket = shoppingbasket.toBuilder()
					.count(1)
					.build();
			
		} else {
			
			shoppingbasket = shoppingbasket.toBuilder()
					.count(shoppingbasket.getCount() - 1)
					.build();
			
		}
		
		return shoppingbasketRepository.save(shoppingbasket);
		
	}
	
	public Shoppingbasket deleteBasket(int id) {
		
		Optional<Shoppingbasket> OpionalShoppingbasket = shoppingbasketRepository.findById(id);
		
		Shoppingbasket shoppingbasket = OpionalShoppingbasket.orElse(null);
		
		if(shoppingbasket != null) {
			shoppingbasketRepository.delete(shoppingbasket);
		}
		
		return shoppingbasket;
	}
	
	public void deleteBasketByMenuId(int menuId) {
		
		shoppingbasketRepository.deleteByMenuId(menuId);
		
	}

}
