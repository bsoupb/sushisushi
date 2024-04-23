package com.bsoupb.sushisushi.bill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.bill.domain.Bill;
import com.bsoupb.sushisushi.bill.repository.BillRepository;

@Service
public class BillService {

	@Autowired
	private BillRepository billRepository;
	
	public List<Bill> getBillList() {
		List<Bill> billList = billRepository.findAllByOrderByIdDesc();
		
		return billList;
	}
	
	public List<Bill> getBillListByUserId(int userId) {
		
		List<Bill> billList = billRepository.findByUserId(userId);
		
		return billList;
	}
	
	
}
