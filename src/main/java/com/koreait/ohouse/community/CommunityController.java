package com.koreait.ohouse.community;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityDomain;
import com.koreait.ohouse.model.CommunityEntity;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

	final private CommunityService service;  
	final private HttpSession hs;
	
	
	@GetMapping("/write")
	public void write() {}
	
	
	@ResponseBody
	@PostMapping("/write") // 커뮤니티 게시판 글쓰기
	public Map<String, Object> write(CommunityDTO p) {
		Map<String, Object> resultValue = new HashMap<>();		
		
		resultValue.put("result", service.insBoard(p));
		return resultValue;
	}
	
	@ResponseBody
	@PostMapping("/uploadImg")
	public Map<String, String> uploadImg(MultipartFile ctntImg) {
		Map<String, String> result = new HashMap();
		result.put("default", service.saveBoardImg(ctntImg));		
		return result; 
	}
	
	@GetMapping("/detail")
	public void detail(CommunityDomain param, Model model) {
		model.addAttribute("data", service.selCmboard(param));
	}
	
	@GetMapping("/photo")
	public void photo() {}
	
	@GetMapping("/houseparty")
	public void houseparty() {}

	@GetMapping("/tip")
	public void tip() {}
	
	@GetMapping("/event")	
	public void event() {}
	
	
}
