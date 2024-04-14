package com.bsoupb.sushisushi.shoppingbasket.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;

public interface ShoppingbasketRepository extends JpaRepository<Shoppingbasket, Integer>{
	
	public Shoppingbasket findBymenuId(int menuId);

}
