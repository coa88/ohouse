package com.koreait.ohouse.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.ohouse.model.CommunityEntity;

@Controller
@RequestMapping("/store")
public class StoreController {
	
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
	public void best() {}


}
