package com.koreait.ohouse.user;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.UserEntity;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	final private UserService service;
	
	final private HttpSession hs;

	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String loginProc(UserEntity param) {
		int result = service.login(param, hs);
		if (result == 1) { // 로그인 성공
			System.out.println("로그인 성공 ");
			return "redirect:/store";
		}
		return null;
	}

	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join")
	public String join(UserEntity p) {
		service.insUser(p);
		return "redirect:/user/login";
	}

	@GetMapping("/logout")
	public String logout(UserEntity param) {
		// 로그아웃시키기
		hs.invalidate();
		return "redirect:/";
	}
	
	
	@GetMapping("/mypage")
	public void openmypage() {
		
	}
	
	@GetMapping("/edit")
	public void seluserdetail(UserEntity param, Model model) {
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
	
		model.addAttribute("userDetail", service.selUser(param)); //유저 정보 가져오기 
		
	}
	@PostMapping("/edit")
	public void edituserdetail(UserEntity param) {	
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		service.updUser(param);
		
	}
	
	
	
	

}
