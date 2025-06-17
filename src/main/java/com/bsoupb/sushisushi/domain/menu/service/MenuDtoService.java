package com.bsoupb.sushisushi.menu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.dto.MenuDetail;
import com.bsoupb.sushisushi.menu.repository.MenuRepository;
import com.bsoupb.sushisushi.soldout.service.SoldoutService;

@Service
public class MenuDtoService {
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Autowired
	private SoldoutService soldoutService;
	
	public List<MenuDetail> getMenuList(String type){
		List<Menu> menuList = menuRepository.findByType(type);
		
		List<MenuDetail> menudetailList = new ArrayList<>();
		
		for(Menu menu:menuList) {
			
			Boolean isSoldout = soldoutService.isSoldout(menu.getId());
			
			MenuDetail menudetail = MenuDetail.builder()
											.id(menu.getId())
											.imagePath(menu.getImagePath())
											.name(menu.getName())
											.type(menu.getType())
											.price(menu.getPrice())
											.dishColor(menu.getDishColor())
											.isSoldout(isSoldout)
											.build();
			
			menudetailList.add(menudetail);
		}
		
		return menudetailList;
	}
	
}
