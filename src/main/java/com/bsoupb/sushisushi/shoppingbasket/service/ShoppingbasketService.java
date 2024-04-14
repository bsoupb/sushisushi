package com.bsoupb.sushisushi.shoppingbasket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;
import com.bsoupb.sushisushi.shoppingbasket.repository.ShoppingbasketRepository;

@Service
public class ShoppingbasketService {

	@Autowired
	private ShoppingbasketRepository shoppingbasketRepository;
	
	public Shoppingbasket addBasket(int userId, int menuId) {
			
		Shoppingbasket shoppingbasket = Shoppingbasket.builder()
													.userId(userId)
													.menuId(menuId)
													.build();
		
		return shoppingbasketRepository.save(shoppingbasket);
		
	}
	
}
