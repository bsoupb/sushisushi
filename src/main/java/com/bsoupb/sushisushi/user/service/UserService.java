package com.bsoupb.sushisushi.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.common.EncryptUtils;
import com.bsoupb.sushisushi.user.domain.User;
import com.bsoupb.sushisushi.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User addUser(String loginId, String password, String name, String address, String email, String hp){
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.loginId(loginId)
						.password(encryptPassword)
						.name(name)
						.address(address)
						.email(email)
						.hp(hp)
						.build();
		
		return userRepository.save(user);

	}
	
	public boolean isDuplicateId(String loginId){
		if(userRepository.countByLoginId(loginId) >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userRepository.findByLoginIdAndPassword(loginId, encryptPassword);
	}
	
}
