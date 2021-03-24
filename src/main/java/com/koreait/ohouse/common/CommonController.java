package com.koreait.ohouse.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommonController {
	
	final private CommonService service;

	@GetMapping({"/","/community"})
	public String community() {
		return "community";
	}
	
	@GetMapping("/store")
	public String store() {
		return "store";
	}
	
	@GetMapping("/error")
	public String error() {
		return "error";
	}
	
	@ResponseBody // 썸네일 이미지
	@PostMapping("/uploadImg")
	public Map<String, String> uploadImg(MultipartFile ctntImg) {
		Map<String, String> result = new HashMap();
		result.put("default", service.saveBoardImg(ctntImg));
		return result;
	}
}
