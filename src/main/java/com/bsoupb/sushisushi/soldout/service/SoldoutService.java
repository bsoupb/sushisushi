package com.bsoupb.sushisushi.soldout.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.soldout.domain.Soldout;
import com.bsoupb.sushisushi.soldout.repository.SoldoutRepository;

@Service
public class SoldoutService {

	
	
	@Autowired
	private SoldoutRepository soldoutRepository;
	
	
	public Soldout addSoldoutMenu(int menuId) {
		
		Soldout soldout = Soldout.builder()
								.menuId(menuId)
								.build();
		
		return soldoutRepository.save(soldout);
		
	}
	
	public Soldout deleteSoldoutMenu(int menuId) {
		
		Optional<Soldout> optionalSoldout = soldoutRepository.findByMenuId(menuId);
		Soldout soldout = optionalSoldout.orElse(null);
		
		if(soldout != null) {
			
			soldoutRepository.delete(soldout);

		}
		
		return soldout; 
	}
	
	public boolean isSoldout(int menuId) {
		
		int count = soldoutRepository.countByMenuId(menuId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
}
