package com.koreait.ohouse.store;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityEntity;
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
		if(SecurityUtils.getLoginUserPk(hs) <= 0) {
			return "redirect:/user/login";			
		}
		if(i_user.getUserRank().equals(1)|| i_user.getUserRank() == null) {
			System.out.println("i_user : " + i_user.getUserRank());
			return "redirect:/";	
		}
		return "store/register";
	}
	
	@GetMapping("/category")
	public void category() {
	}

	@PostMapping("/category")
	public String category(CommunityEntity p) {
		return "";
	}

	@GetMapping("/store_detail")
	public void store_detail() {
	}

	@GetMapping("/best")
	public void best(Model model, StoreEntity p) {
		p.setiProduct(2);
		model.addAttribute("data", service.selPdBoard(p));
	}

}
