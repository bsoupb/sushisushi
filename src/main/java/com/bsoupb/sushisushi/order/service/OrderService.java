package com.bsoupb.sushisushi.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.bill.domain.Bill;
import com.bsoupb.sushisushi.bill.repository.BillRepository;
import com.bsoupb.sushisushi.menu.domain.Menu;
import com.bsoupb.sushisushi.menu.service.MenuService;
import com.bsoupb.sushisushi.order.domain.Order;
import com.bsoupb.sushisushi.order.dto.OrderDetail;
import com.bsoupb.sushisushi.order.repository.OrderRepository;
import com.bsoupb.sushisushi.shoppingbasket.domain.Shoppingbasket;
import com.bsoupb.sushisushi.shoppingbasket.dto.ShoppingbasketDetail;
import com.bsoupb.sushisushi.shoppingbasket.repository.ShoppingbasketRepository;
import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private ShoppingbasketService shoppingbasketService;
	
	@Autowired
	private ShoppingbasketRepository shoppingbasketRepository;
	
	
	/*
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
	*/
	
	/*
	public Bill insertOrder(int userId, String address) {

		List<Shoppingbasket> shoppingbasketList = shoppingbasketService.getShoppingbasketListByUserId(userId);
		int totalDish = 0;
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			totalDish += shoppingbasket.getCount();
		}
		
		String number = "RS" + Math.round((Math.random()*100000+800000));
		
		
		Bill bill = Bill.builder()
						.userId(userId)
						.number(number)
						.totalDish(totalDish)
						.address(address)
						.build();
		
		billRepository.save(bill);
		
		// 주문 정보 추가
		// 장바구니에 있는 목록을 order 테이블로 저장

		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			
			Order order = Order.builder()
					.menuId(shoppingbasket.getMenuId())
					.userId(shoppingbasket.getUserId())
					.billId(bill.getId())
					.totalDish(shoppingbasket.getCount())
					.build();
			
			orderRepository.save(order);
		}
		
		List<Shoppingbasket> shoppingbasketDeleteList = shoppingbasketRepository.findByUserId(userId);
		
		if(shoppingbasketDeleteList != null) {
			shoppingbasketRepository.deleteAll(shoppingbasketDeleteList);
		}
	
		
		return bill;

	}
	*/
	
	public void deleteOrderByMenuId(int menuId) {
		
		orderRepository.deleteByMenuId(menuId);
		
	}
	
}
