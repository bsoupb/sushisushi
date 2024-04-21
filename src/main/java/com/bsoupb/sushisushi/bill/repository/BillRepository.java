package com.bsoupb.sushisushi.bill.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.bill.domain.Bill;

public interface BillRepository extends JpaRepository<Bill, Integer>{

	public Bill findByUserId(int userId);
	
}
