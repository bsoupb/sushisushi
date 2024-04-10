package com.bsoupb.sushisushi.menu.domain;

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
@Table(name="Menu")
@Entity
public class Menu {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="userId")
	private int userId;
	
	@Column(name="imagePath")
	private String imagePath;
	
	private String name;
	private String type;
	private int price;
	
	@Column(name="dishColor")
	private String dishColor;

	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private Date createdAt;

	@Column(name="updatedAt")
	private Date updatedAt;
	
}
