package com.bsoupb.sushisushi.domain.member.repository;

import com.bsoupb.sushisushi.domain.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	// count WHERE loginId= #{}	
	public int countByLoginId(String loginId);
	
	// WHERE loginId = #{} AND password = #{}
	public Member findByLoginIdAndPassword(String loginId, String password);
	
	public Member findById(int id);

	Optional<Member> findByEmail(String email);
}
