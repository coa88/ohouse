package com.koreait.ohouse.user;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.UserEntity;

import lombok.Setter;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private HttpSession hs;

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
	public void seluserdetail(UserEntity param, Model model, HttpSession hs) {
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		model.addAttribute("userDetail", service.selUser(param)); //유저 정보 가져오기 
		
	}
	@PostMapping("/mypage")
	public void seluserdetail(UserEntity param) {
		
		service.updUser(param, hs);
		
	}
	

}
