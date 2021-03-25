package com.koreait.ohouse.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.UserDTO;
import com.koreait.ohouse.model.UserEntity;
import com.oreilly.servlet.MultipartRequest;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	final private UserService service;
	
	final private HttpSession hs;
	
	final private HttpServletRequest request;
	
	final private HttpServletResponse response;

	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String loginProc(UserDTO param) {
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
	public String join(UserDTO p) {
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
	public void seluserdetail(UserDTO param, Model model) {
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		model.addAttribute("userDetail", service.selUser(param)); // 유저 정보 가져오기
	}

	@PostMapping("/edit")
	public Map<String, Object> edituserdetail(UserDTO param) {	
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		Map<String, Object> resultValue = new HashMap<>();
		resultValue.put("result", service.updUser(param));
		return resultValue;

	}
	
	
    
	@GetMapping("/edit_password")
	public void changeUserPw() {
		
	}
	@PostMapping("/edit_password")
	public String changeUserPw(UserDTO param){
		int result = service.changePw(param);
		
		if(result == 1) { //비밀번호 변경 성공시
			hs.invalidate();
			return "redirect:/user/login";
		}
		return "redirect:/user/edit_password";
	}
	
	@GetMapping("/withdraw")
	public void userWithdraw(){
		
	}
	@PostMapping("/withdraw")
	public String userWithdraw(UserDTO param) {
		service.delUser(param);
		return "redirect:/";
	}
	

	// 회원가입 중복 체크
	@ResponseBody
	@PostMapping("/emailIdChk")
	public Map<String, Object> emailIdChk(@RequestBody UserEntity p) {
		Map<String, Object> emailIdVal = new HashMap<>();
		emailIdVal.put("emailId", service.emailIdChk(p));
		return emailIdVal;
	}

	@ResponseBody
	@PostMapping("/nmChk")
	public Map<String, Object> nmChk(@RequestBody UserEntity p) {
		Map<String, Object> nmVal = new HashMap<>();
		nmVal.put("nm", service.nmChk(p));
		return nmVal;
	}

}
