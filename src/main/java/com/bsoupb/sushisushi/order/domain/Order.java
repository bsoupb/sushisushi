package com.bsoupb.sushisushi.order.domain;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder(toBuilder=true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="order")
@Entity
public class Order {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="menuId")
	private int menuId;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="orderId")
	private int orderId;
	
	@Column(name="totalDish")
	private int totalDish;
	
	@Column(name="createdAt", updatable=false)
	@UpdateTimestamp
	private Date createdAt;
	
	@Column(name="updatedAt")
	private Date updatedAt;
	
}
