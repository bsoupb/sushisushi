package com.bsoupb.sushisushi.menu.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bsoupb.sushisushi.common.FileManager;
import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.repository.MenuRepository;

@Service
public class MenuService {

	@Autowired
	private MenuRepository menuRepository;
	
	public Menu addMenu(int userId, MultipartFile file, String name, String type, int price, String dishColor){
		
		String filePath = FileManager.saveFile(userId, file);

		Menu menu = Menu.builder()
						.userId(userId)
						.imagePath(filePath)
						.name(name)
						.type(type)
						.price(price)
						.dishColor(dishColor)
						.build();

		return menuRepository.save(menu);

	}

	public List<Menu> getMenuList(String type){
		List<Menu> menuList = menuRepository.findByType(type);
		return menuList;
	}
	
	public Menu getMenu(int id) {
		Optional<Menu> optionalMenu = menuRepository.findById(id);
		Menu menu = optionalMenu.orElse(null);
		return menu;
	}
	
	
	public Menu updateMenu(int id, int userId, String name, String type, int price, String dishColor){

		Optional<Menu> OptionalMenu = menuRepository.findById(id);
		Menu menu = OptionalMenu.orElse(null);
		
		if(menu != null){
		
			menu = menu.toBuilder()
						.userId(userId)
						.name(name)
						.type(type)
						.price(price)
						.dishColor(dishColor)
						.build();

			menu = menuRepository.save(menu);
		}
		
		
		return menu;
		
	}
	
	public Menu deleteMenu(int id) {
		
		Optional<Menu> OptionalMenu = menuRepository.findById(id);
		Menu menu = OptionalMenu.orElse(null);
		
		if(menu != null) {
			
			FileManager.removeFile(menu.getImagePath());
			menuRepository.delete(menu);
		}
		
		return menu;
		
	}
	
	/*
	public Menu soldoutMenu(int id, String name, String type, int price, String dishColor) {
		
		Optional<Menu> OptionalMenu = menuRepository.findById(id);
		Menu menu = OptionalMenu.orElse(null);
		
		if(menu != null) {
			
			menu = menu.toBuilder()
						.name(name + "Sold Out")
						.type(type)
						.price(price)
						.dishColor(dishColor)
						.build();
			
			menu = menuRepository.save(menu);
			
		}
		
		return menu;
		
	}
	*/
	
	public Menu getMenuById(int userId) {
		return menuRepository.findByUserId(userId);
	}
	
}
