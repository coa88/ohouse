package com.koreait.ohouse.store;

import org.springframework.stereotype.Controller;
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


}
