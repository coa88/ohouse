package com.koreait.ohouse.store;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@PostMapping("/register")
	public Map<String, Object> register(StoreDTO param) {
		Map<String, Object> resultValue = new HashMap<>();
		// service.insBoard(param);
		System.out.println("PdTyp : " + param.getProductTyp());
		System.out.println("PdSecTyp : " + param.getProductSectyp());
		resultValue.put("result", service.insPdBoard(param));
		resultValue.put("iBoard", param.getiProduct());
		return resultValue;
	}
	
	@GetMapping("/category")
	public void category() {
	}

	@PostMapping("/category")
	public String category(CommunityEntity p) {
		return "";
	}

	@GetMapping("/product_info")
	public void product_info() {
	}

	@GetMapping("/best")
	public void best(Model model, StoreDTO p) {
		p.setiProduct(2);
		model.addAttribute("data", service.selPdBoard(p));
	}

}
