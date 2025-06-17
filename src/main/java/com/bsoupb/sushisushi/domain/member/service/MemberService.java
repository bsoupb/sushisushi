package com.bsoupb.sushisushi.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.sushisushi.global.common.EncryptUtils;
import com.bsoupb.sushisushi.user.domain.User;

@Service
public class MemberService {

	@Autowired
	private com.bsoupb.sushisushi.user.repository.MemberRepository memberRepository;

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
		
		return memberRepository.save(user);

	}
	
	public boolean isDuplicateId(String loginId){
		if(memberRepository.countByLoginId(loginId) >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return memberRepository.findByLoginIdAndPassword(loginId, encryptPassword);
	}
	
	public User getUserById(int id) {
		return memberRepository.findById(id);
	}
	
}
