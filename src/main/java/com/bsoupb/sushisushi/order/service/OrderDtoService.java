package com.bsoupb.sushisushi.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;
import com.bsoupb.sushisushi.order.domain.Order;
import com.bsoupb.sushisushi.order.dto.OrderDetail;
import com.bsoupb.sushisushi.order.repository.OrderRepository;
import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

@Service
public class OrderDtoService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ShoppingbasketService shoppingbasketService;
	
	
	public Map<String, Object> getOrderList(int billId){
		List<Order> orderList = orderRepository.findByBillId(billId);
		
		List<OrderDetail> orderDetailList = new ArrayList<>();
		
		int totalPrice = 0;
		int totalDish = 0;
		
		for(Order order:orderList) {
			
			int menuId = order.getMenuId();
		
			Optional<Menu> optionalMenu = menuService.getMenuByMenuId(menuId);
			Menu menu = optionalMenu.orElse(null);
			
			int count = order.getTotalDish();
			int price = menu.getPrice();
			
			Boolean isShoppingbasket = shoppingbasketService.isShoppingbasket(menuId, billId);
			
			OrderDetail orderdetail = OrderDetail.builder()
												.billId(order.getBillId())
												.totalDish(order.getTotalDish())
												.name(menu.getName())
												.price(menu.getPrice())
												.isShoppingbasket(isShoppingbasket)
												.build();
			
			orderDetailList.add(orderdetail);
			
			totalDish += count;
			totalPrice += price * count;
			
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("totalDish", totalDish);
		resultMap.put("totalPrice", totalPrice);
		resultMap.put("orderdetail", orderDetailList);
		
		return resultMap;
	}
	
	
}
