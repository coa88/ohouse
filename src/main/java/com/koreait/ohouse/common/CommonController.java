package com.koreait.ohouse.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.community.CommunityService;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.PagingDTO;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.store.StoreService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommonController {
	
	final private CommonService service;
	final private CommunityService cmService;
	final private StoreService storeService;
	
	@GetMapping({"/","/community"})
	public String community(CommunityDTO param, Model model) {
		model.addAttribute("best", cmService.selCmBoardBest(param, 3, 0, 1));
		model.addAttribute("photoBest", cmService.selCmBoardBest(param, 2, 0, 8));
		model.addAttribute("housepartyBest", cmService.selCmBoardBest(param, 3, 1, 3));
		return "community";
	}
	
	@GetMapping("/store")
	public String store(StoreDTO param, Model model) {
		model.addAttribute("pdSales", storeService.selPdBoardSales(param, param.getCategory(), 0, 4));
		
		return "store";
	}
	
	@ResponseBody // 썸네일 이미지
	@PostMapping("/uploadImg")
	public Map<String, String> uploadImg(MultipartFile ctntImg) {
		Map<String, String> result = new HashMap();
		result.put("default", service.saveBoardImg(ctntImg));
		return result;
	}
	
	@GetMapping("/search")
	public void searchList(@RequestParam String searchText, @RequestParam int searchTyp, Model model) {
		PagingDTO dto = new PagingDTO();
		dto.setSearchText(searchText);

		if(searchTyp == 0) { // 더보기 안눌렀을때 리스트
			for(int i=2; i < 5; i++) {
				dto.setSecTyp(i);
				dto.setsIdx(0);
				dto.setRecordCntPerPage(4);
				if(cmService.selCmSearchList(dto).size() != 0) {
					model.addAttribute("cmList" + i, cmService.selCmSearchList(dto));					
				}
				if(storeService.selPdSearchList(dto).size() != 0) {
					model.addAttribute("pdList", storeService.selPdSearchList(dto));					
				}
			}
			return;
		}
		if(searchTyp == 5) { // 스토어 더보기 눌렀을때
			model.addAttribute("pdList", storeService.selPdSearchList(dto));
			return;
		}
		
		dto.setSecTyp(searchTyp); // 커뮤니티 게시판 더보기 눌렀을때
		model.addAttribute("cmList" + searchTyp, cmService.selCmSearchList(dto));
	}
	
	@GetMapping("/error")
	public String error() {
		return "error";
	}
}
