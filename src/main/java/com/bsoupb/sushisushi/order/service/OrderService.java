package com.bsoupb.sushisushi.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;
import com.bsoupb.sushisushi.order.domain.Order;
import com.bsoupb.sushisushi.order.dto.OrderDetail;
import com.bsoupb.sushisushi.order.repository.OrderRepository;
import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;
import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ShoppingbasketService shoppingbasketService;
	
	public List<OrderDetail> getOrderList(int userId){
		List<Order> orderList = orderRepository.findAllByOrderByIdDesc();
		
		List<OrderDetail> orderDetailList = new ArrayList<>();
		
		for(Order order:orderList) {
			
			int menuId = order.getMenuId();
		
			Menu menu = menuService.getMenuById(userId);
			
			Boolean isShoppingbasket = shoppingbasketService.isShoppingbasket(menuId, userId);
			
			OrderDetail orderdetail = OrderDetail.builder()
												.menuId(order.getMenuId())
												.userId(order.getUserId())
												.billId(order.getBillId())
												.totalDish(order.getTotalDish())
												.name(menu.getName())
												.isShoppingbasket(isShoppingbasket)
												.build();
			
			orderDetailList.add(orderdetail);
			
		}
		
		
		return orderDetailList;
	}
	
	public Order insertOrder(userId) {
		
		Bill bill = Bill.builder()
					
		
		// 주문 정보 추가
		// 장바구니에 있는 목록을 order 테이블로 저장
		List<Shoppingbasket> shoppingbasketList = shoppingbasketService.getShoppingbasketListByUserId(userId);
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			
	
			Order order = Order.builder()
					.menuId(shoppingbasket.getMenuId())
					.userId(shoppingbasket.getUserId())
					.billId()
					.totalDish(shoppingbasket.getCout())
					.build();
			
			
		}
		
		
		return orderRepository.save(order);
		
	}
	
}
