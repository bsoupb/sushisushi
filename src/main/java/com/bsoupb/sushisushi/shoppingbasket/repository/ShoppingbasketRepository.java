package com.bsoupb.sushisushi.shoppingbasket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;

import jakarta.transaction.Transactional;

public interface ShoppingbasketRepository extends JpaRepository<Shoppingbasket, Integer>{
	
	public List<Shoppingbasket> findAllByOrderByIdDesc();
	
	public Shoppingbasket findBymenuId(int menuId);
	
	public int countByMenuIdAndUserId(int menuId, int userId);
	
	public int countByMenuId(int menuId);
	
	public List<Shoppingbasket> findByUserId(int userId);
	
	public Shoppingbasket findByMenuIdAndUserId(int menuId, int userId);
	
	@Transactional
	public void deleteByMenuId(int menuId);

}
