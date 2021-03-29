package com.koreait.ohouse.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.StoreEntity;
import com.koreait.ohouse.model.UserEntity;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class StoreController {

	final StoreService service;
	final private HttpSession hs;

	@GetMapping("/register")
	public String register() {
		UserEntity i_user = SecurityUtils.getLoginUser(hs);
		if(!(SecurityUtils.getLoginUserPk(hs) > 0) || i_user.getUserRank() == null) {
			return "redirect:/user/login";
		}
		return "store/register";
	}

	@ResponseBody
	@PostMapping("/register")
	public Map<String, Object> register(StoreDTO param) {
		Map<String, Object> resultValue = new HashMap<>();
		System.out.println("category : "+param.getCategory());
		resultValue.put("result", service.insPdBoard(param));
		resultValue.put("iProduct", param.getiProduct());
		return resultValue;
	}

	@GetMapping("/category")
	public String category(StoreDTO param, Model model) {
		System.out.println("카운트" + param.getProductCnt());
		System.out.println("카운트" + param.getSales());
		model.addAttribute("list", service.selPdBoardList(param));
		return "store/category";
	}

	@PostMapping("/category")
	public String category(CommunityEntity p) {
		return "";
	}
	
	@GetMapping("/category/productInfo")
	public String productInfo(StoreDTO param, Model model) {
		System.out.println(param.getFinalPrice());
		model.addAttribute("photoList", service.selPdPhotoList(param));
		model.addAttribute("data", service.selPdBoard(param));
		return "store/product_info";
	}

	@GetMapping("/product_info")
	public void product_info() {
	}
}
