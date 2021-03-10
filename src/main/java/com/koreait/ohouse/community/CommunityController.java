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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

	final private CommunityService service;
	private MultipartFile img;
	
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
	@PostMapping("/write") // 커뮤니티 게시판 글쓰기
	public Map<String, Object> write(@RequestBody  CommunityEntity param) {
		Map<String, Object> resultValue = new HashMap<>();		
		resultValue.put("result", service.insBoard(param, img));
		return resultValue;
	}
	
	
	@ResponseBody //커뮤니티 게시물 대표이미지 업로드
	@PostMapping("/imgUpload")
	public void imgUpload(@RequestBody MultipartFile boardImg) {
		img = boardImg;
	}
	
	@ResponseBody //커뮤니티 게시물 대표이미지 업로드
	@PostMapping("/writeImgUpload")
	public void writeImgUpload(@RequestBody CommunityDTO param) {
		
	}
}
