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

	public List<Menu> getMenuList(){
		List<Menu> menuList = menuRepository.findAllByOrderByIdDesc();
		return menuList;
	}
	
	public Menu updateMenu(int id, int userId, String name, String type, int price, String dishColor){

		Optional<Menu> OptionalMenu = menuRepository.findById(id);
		Menu menu = OptionalMenu.orElse(null);
		
		if(menu != null){
		
			menu = Menu.builder()
						.userId(userId)
						.name(name)
						.type(type)
						.price(price)
						.dishColor(dishColor)
						.build();

		}

		return menu;
		
	}
	
}
