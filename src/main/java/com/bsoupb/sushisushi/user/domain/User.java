package com.bsoupb.sushisushi.user.domain;

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
@Table(name="User")
@Entity
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="loginId")
	private String loginId;
	private String password;
	private String name;
	private String address;
	private String email;
	private String hp;

	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private Date createdAt;

	@Column(name="updatedAt")
	private Date updatedAt;
	
}
