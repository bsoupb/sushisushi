package com.bsoupb.sushisushi.bill.domain;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="bill")
@Entity
public class Bill {

	private int id;
	private int userId;
	private String number;
	private int totalDish;
	private Date createdAt;
	private Date updatedAt;
	
}
