package com.bsoupb.sushisushi.shoppingbasket.service;

import java.util.ArrayList;
import java.util.List;
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
	
	@Autowired
	private MenuService menuService;
	
	public Shoppingbasket addBasket(int userId, int menuId) {
			
		Shoppingbasket shoppingbasket = Shoppingbasket.builder()
													.userId(userId)
													.menuId(menuId)
													.build();
		
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
	
	public List<ShoppingbasketDetail> getShoppingbasketList(int userId){
		
		List<Shoppingbasket> shoppingbasketList = shoppingbasketRepository.findByUserId(userId);
		
		List<ShoppingbasketDetail> shoppingbasketDetailList = new ArrayList<>();
		
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			 
			int menuId = shoppingbasket.getMenuId();
			Optional<Menu> optionalMenu = menuService.getMenuByMenuId(menuId);
			Menu menu = optionalMenu.orElse(null);
			
			ShoppingbasketDetail shoppingbasketDetail = ShoppingbasketDetail.builder()
																			.menuId(shoppingbasket.getMenuId())
																			.userId(shoppingbasket.getUserId())
																			.count(shoppingbasket.getCount())
																			.name(menu.getName())
																			.build();
			
			shoppingbasketDetailList.add(shoppingbasketDetail);
		}

		return shoppingbasketDetailList;
	}
	
}
