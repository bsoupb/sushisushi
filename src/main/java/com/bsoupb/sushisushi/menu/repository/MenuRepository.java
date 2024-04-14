package com.bsoupb.sushisushi.menu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.menu.domain.Menu;


public interface MenuRepository extends JpaRepository<Menu, Integer>{

	public List<Menu> findAllByOrderByIdDesc();
	
	public List<Menu> findByType(String type);
	
	public Menu findByUserId(int userId);
	
}
