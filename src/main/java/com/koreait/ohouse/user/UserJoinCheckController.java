package com.koreait.ohouse.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.ohouse.model.UserEntity;

@Controller
public class UserJoinCheckController {
	@Autowired
	private UserService service;

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