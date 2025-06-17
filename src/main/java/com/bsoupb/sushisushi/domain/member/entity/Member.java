package com.bsoupb.sushisushi.domain.member.entity;

import java.util.Date;

import jakarta.persistence.*;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder(toBuilder=true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="member")
@Entity
public class Member {

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

	@Enumerated(EnumType.STRING)    // enum 타입 가져오기
	@Column(nullable = false)
	private Role role;

	public enum Role {
		CUSTOMER, ADMIN
	}
}
