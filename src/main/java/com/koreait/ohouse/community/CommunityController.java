package com.koreait.ohouse.community;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/write")
	public String write(CommunityEntity param, HttpSession hs) {
		System.out.println(param.getTyp());
		System.out.println(param.getSecTyp());
		System.out.println(param.getSeq());
		System.out.println(param.getTitle());
		System.out.println(param.getCtnt());
		param.setiUser(1);
		service.insBoard(param);
		return "redirect:/board/detail?i_board=" + param.getiBoard();
	}
}
