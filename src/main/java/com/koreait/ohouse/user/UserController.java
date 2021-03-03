package com.koreait.ohouse.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.ohouse.model.UserEntity;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	

	@GetMapping("/login")
	public void login() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(UserEntity param) {	 
		service.insUser(param);
		return "redirect:/user/login";
	}
	
	
	

}
