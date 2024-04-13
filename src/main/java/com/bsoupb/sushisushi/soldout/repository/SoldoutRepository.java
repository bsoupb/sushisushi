package com.bsoupb.sushisushi.soldout.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.soldout.domain.Soldout;

public interface SoldoutRepository extends JpaRepository<Soldout, Integer>{

	public int countByMenuId(int menuId);
	
	public Optional<Soldout> findByMenuId(int menuId);
	
}
