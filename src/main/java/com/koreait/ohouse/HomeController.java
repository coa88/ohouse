package com.koreait.ohouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	
	@GetMapping({"/","/community"})
	public String community() {
		return "community";
	}
	
	@GetMapping("/store")
	public String store() {
		return "store";
	}
	
}
