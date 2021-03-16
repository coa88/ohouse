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
@RequestMapping("/user")
public class UserJoinCheckController {
	@Autowired
	private UserService service;

	@ResponseBody
	@PostMapping("/nmChk")
	public Map<String, Object> nmChk(@RequestBody UserEntity p) {
		Map<String, Object> nmVal = new HashMap<>();
		nmVal.put("isExist", service.nmChk(p));
		return nmVal;
	}
}
