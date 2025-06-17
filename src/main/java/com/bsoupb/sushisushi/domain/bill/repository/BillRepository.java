package com.bsoupb.sushisushi.domain.bill.repository;

import java.util.List;

import com.bsoupb.sushisushi.domain.bill.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BillRepository extends JpaRepository<Bill, Integer>{

	public List<Bill> findByUserId(int userId);
	
	public List<Bill> findAllByOrderByIdDesc();
	

}
