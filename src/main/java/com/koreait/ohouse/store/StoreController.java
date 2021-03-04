package com.koreait.ohouse.store;

import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@GetMapping("/store_home")
	public void storeHome() {}

	@GetMapping("/category")
	public void category() {}
	
	@GetMapping("/store_detail")
	public void store_detail() {}

	@GetMapping("/best")
	public void best() {}
=======
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.StoreEntity;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class StoreController {
	
	final StoreService service;
	
	@GetMapping("/store_home")
	public void storeHome() {}

	@GetMapping("/category")
	public void category() {}
	
	@PostMapping("/category")
	public String category(CommunityEntity p) {
		return "";
	}
	
	@GetMapping("/store_detail")
	public void store_detail() {}

	@GetMapping("/best")
	public void best(Model model, StoreEntity p) {
		p.setiProduct(2);
		model.addAttribute("data", service.selPdBoard(p));
	}
>>>>>>> branch 'master' of https://github.com/coa88/ohouse.git


}
