package com.bsoupb.sushisushi.bill.domain;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="userId")
	private int userId;
	
	private String number;
	
	@Column(name="totalDish")
	private int totalDish;
	
	@Column(name="createdAt", updatable=false)
	@UpdateTimestamp
	private Date createdAt;
	
	@Column(name="updatedAt")
	private Date updatedAt;
	
}
