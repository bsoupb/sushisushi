package com.bsoupb.sushisushi.order.service;

import java.util.ArrayList;
import java.util.List;

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
import com.bsoupb.sushisushi.shoppingbasket.service.ShoppingbasketService;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private BillRepository billRepository;
	
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
	
	public Order insertOrder(int userId, String address) {

		List<Shoppingbasket> shoppingbasketList = shoppingbasketService.getShoppingbasketListByUserId(userId);
		int totalDish = 0;
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			totalDish += shoppingbasket.getCount();
		}
		
		String number = "RS" + Math.round((Math.random()*100000+800000));
		
		Bill bill = billRepository.findByUserId(userId);
		
		bill = Bill.builder()
						.userId(userId)
						.number(number)
						.totalDish(totalDish)
						.address(address)
						.build();
		
		billRepository.save(bill);
		
		// 주문 정보 추가
		// 장바구니에 있는 목록을 order 테이블로 저장

		
		Order order = orderRepository.findByUserId(userId);
		
		
		for(Shoppingbasket shoppingbasket:shoppingbasketList) {
			
			
			
			order = Order.builder()
					.menuId(shoppingbasket.getMenuId())
					.userId(shoppingbasket.getUserId())
					.billId(bill.getId())
					.totalDish(shoppingbasket.getCount())
					.build();
			
			orderRepository.save(order);
		}
		
		return order;

		
	}
	
	
	
}
