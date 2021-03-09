package com.koreait.ohouse.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.model.CommunityEntity;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

	final private CommunityService service;
	
	@GetMapping("/photo")
	public void photo() {}
	
	@GetMapping("/houseparty")
	public void houseparty() {}

	@GetMapping("/tip")
	public void tip() {}
	
	@GetMapping("/event")
	public void event() {}
	
	@GetMapping("/write")
	public void write() {}
	
	@ResponseBody
	@PostMapping("/write")
	public Map<String, Object> write(@RequestBody CommunityEntity param) {
		Map<String, Object> resultValue = new HashMap<>();
		System.out.println("title : " + param.getTitle());
		System.out.println("ctnt : " + param.getCtnt());
		System.out.println("typ : " + param.getTyp());
		System.out.println("secTyp : " + param.getSecTyp());
		//resultValue.put("result", service.insBoard(param));
		resultValue.put("result", "성공");
		
		return resultValue;
	}
}
