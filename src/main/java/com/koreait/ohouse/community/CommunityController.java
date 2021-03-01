package com.koreait.ohouse.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@GetMapping("/home")
	public void home() {}

	@GetMapping("/photo")
	public void photo() {}
	
	@GetMapping("/houseparty")
	public void houseparty() {}

	@GetMapping("/tip")
	public void tip() {}
	
	@GetMapping("/event")
	public void event() {}
}
