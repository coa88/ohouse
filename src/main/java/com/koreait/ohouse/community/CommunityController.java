package com.koreait.ohouse.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityCmtDTO;
import com.koreait.ohouse.model.CommunityCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

	final private CommunityService service;
	final private HttpSession hs;

	@GetMapping("/write")
	public String write() {
		if (SecurityUtils.getLoginUserPk(hs) <= 0) {
			return "redirect:/user/login";
		}
		return "community/write";
	}

	@ResponseBody
	@PostMapping("/write") // 커뮤니티 게시판 글쓰기
	public Map<String, Object> write(CommunityDTO param) {
		Map<String, Object> resultValue = new HashMap<>();
		resultValue.put("result", service.insCmBoard(param));
		resultValue.put("iBoard", param.getiBoard());
		return resultValue;
	}

	@GetMapping("/modify") // 수정
	public String Modify(CommunityDTO param, Model model) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		if (i_user < 1) { // 로그인 안됬을때
			return "user/login";
		}
		model.addAttribute("data", service.selCmBoard(param));
		return "community/write";
	}

	@GetMapping("/photo") // 사진게시판 리스트
	public String photo(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(2);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/photo";
	}

	@GetMapping("/photo/detail") // 사진 디테일페이지
	public String photoDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	@GetMapping("/houseparty") // 집들이게시판 리스트
	public String houseparty(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(3);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/houseparty";
	}

	@GetMapping("/houseparty/detail") // 집들이 디테일페이지
	public String housepartyDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	@GetMapping("/tip") // 노하우게시판 리스트
	public String tip(CommunityDTO param, Model model) {
		param.setTyp(1);
		param.setSecTyp(4);
		model.addAttribute("list", service.selCmBoardList(param));
		return "community/tip";
	}

	@GetMapping("/tip/detail") // 노하우 디테일페이지
	public String tipDetail(CommunityDTO param, Model model) {
		model.addAttribute("data", service.selCmBoard(param));
		return "community/detail";
	}

	@GetMapping("/event")
	public String event() {
		return "community/event";
	}

	@ResponseBody // 수정 Post
	@PostMapping("/modify")
	public Map<String, Object> modCmBoard(CommunityDTO param) {

		for (String src : param.getSrc()) {
			System.out.println(src);
		}

		Map<String, Object> resultValue = new HashMap();
		resultValue.put("result", service.updCmBoard(param));
		resultValue.put("iBoard", param.getiBoard());
		return resultValue;
	}

	@ResponseBody // 삭제 Post
	@DeleteMapping("/delCmBoard/{iBoard}")
	public Map<String, Object> delCmBoard(CommunityDTO param) {
		Map<String, Object> resultValue = new HashMap();
		resultValue.put("result", service.delCmBoard(param));
		return resultValue;
	}

	// ----------------------------커뮤니티 댓글----------------------------//

	@ResponseBody
	@PostMapping("/insCmt")
	public Map<String, Object> insCmt(@RequestBody CommunityCmtEntity p, HttpSession hs) {
		p.setiUser(SecurityUtils.getLoginUserPk(hs));
		Map<String, Object> returnValue = new HashMap<>();
		returnValue.put("result", service.insCmt(p));
		return returnValue;
	}

	@ResponseBody
	@GetMapping("/cmtList")
	public List<CommunityCmtDTO> selCmtList(CommunityCmtDTO p, HttpSession hs) {
		p.setiUser(SecurityUtils.getLoginUserPk(hs));
		return service.selCmtList(p);
	}

	@ResponseBody
	@DeleteMapping("/delCmt")
	public Map<String, Object> delCmt(CommunityCmtEntity p, HttpSession hs) {
		p.setiUser(SecurityUtils.getLoginUserPk(hs));

		Map<String, Object> returnValue = new HashMap<>();
		returnValue.put("result", service.delCmt(p));
		return returnValue;
	}

	// ----------------------------커뮤니티 대댓글----------------------------//

	@ResponseBody
	@PostMapping("/insReCmt")
	public Map<String, Object> insReCmt(@RequestBody CommunityCmtEntity p, HttpSession hs) {
		System.out.println("cmt_group :" + p.getCmtGroup());
		System.out.println("i_board : " + p.getiBoard());
		System.out.println("ctnt : " + p.getCtnt());

		p.setiUser(SecurityUtils.getLoginUserPk(hs));
		Map<String, Object> returnValue = new HashMap<>();
		returnValue.put("result", service.insReCmt(p));
		return returnValue;
	}
}
