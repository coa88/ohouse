package com.koreait.ohouse.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.BoardCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

	final private CommunityService service;
	final private HttpSession hs;

	@GetMapping("/write")
	public void write() {
	}

	@ResponseBody
	@PostMapping("/write") // 커뮤니티 게시판 글쓰기
	public Map<String, Object> write(CommunityDTO param) {
		Map<String, Object> resultValue = new HashMap<>();
		resultValue.put("result", service.insBoard(param));
		service.insBoard(param);
		resultValue.put("result", param.getiBoard());
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
	public void detail(CommunityDTO param, Model model) {
		System.out.println("ppp : " + param.getiBoard());
		model.addAttribute("data", service.selCmBoard(param));
	}

	@GetMapping("/photo")
	public String photo(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(2);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/photo";
	}
	
	@GetMapping("/photo/detail")
	public String photoDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	@GetMapping("/houseparty")
	public String houseparty(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(3);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/houseparty";
	}
	
	@GetMapping("/houseparty/detail")
	public String housepartyDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	public String tip(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(4);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/tip";
	}
	
	@GetMapping("/tip/detail")
	public String tipDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	@GetMapping("/event")	
	public String event() {
		return "community/event";
	}

	// ----------------------------CMT----------------------------//

	@ResponseBody
	@PostMapping("/insCmt")
	public Map<String, Object> insCmt(@RequestBody BoardCmtEntity p, HttpSession hs) {

		System.out.println("i_board : " + p.getiBoard());
		System.out.println("ctnt : " + p.getCtnt());

		p.setiUser(SecurityUtils.getLoginUserPk(hs));

		Map<String, Object> returnValue = new HashMap<>();
		returnValue.put("result", service.insCmt(p));
		return returnValue;
	}

}
