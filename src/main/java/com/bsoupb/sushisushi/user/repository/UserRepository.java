package com.bsoupb.sushisushi.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.user.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	// count WHERE loginId= #{}	
	public int countByLoginId(String loginId);
	
	// WHERE loginId = #{} AND password = #{}
	public User findByLoginIdAndPassword(String loginId, String password);
	
	public User findById(int id);
	
}
