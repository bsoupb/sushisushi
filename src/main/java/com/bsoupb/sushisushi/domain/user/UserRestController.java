package com.bsoupb.sushisushi.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.sushisushi.user.domain.User;
import com.bsoupb.sushisushi.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/join")
	public Map<String, String> join(
					@RequestParam("loginId") String loginId
					, @RequestParam("password") String password
					, @RequestParam("name") String name
					, @RequestParam("address") String address
					, @RequestParam("email") String email
					, @RequestParam("hp") String hp
									){
		
			User user = userService.addUser(loginId, password, name, address, email, hp);
			
			Map<String, String> resultMap = new HashMap<>();

			if(user != null){
				resultMap.put("result", "success");
			} else {
				resultMap.put("result", "fail");
			}

			return resultMap;

	}
	
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicateId(
					@RequestParam("loginId") String loginId	
											){
		
		boolean isDuplicate = userService.isDuplicateId(loginId);

		Map<String, Boolean> resultMap = new HashMap<>();

		resultMap.put("isDuplicate", isDuplicate);

		return resultMap;

	}
	
	@PostMapping("/login")
	public Map<String, String> login(
					@RequestParam("loginId") String loginId
					, @RequestParam("password") String password
					, HttpServletRequest request
									){
		
		User user = userService.getUser(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();

		if(user != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());

			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}
