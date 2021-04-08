package com.koreait.ohouse.store;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.StoreDTO;
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
		model.addAttribute("pdSales", service.selPdBoardSales(param, param.getCategory(), 0, 5));
		model.addAttribute("category", service.selPdCategory(param));
		model.addAttribute("categoryList", service.selPdCategoryList());
		model.addAttribute("data", service.selPdBoardList(param));
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
	
	@ResponseBody // 삭제 Post
	@DeleteMapping("/delPdBoard/{iProduct}")
	public Map<String, Object> delCmBoard(StoreDTO param) {
		System.out.println("iProduct : " + param.getiProduct());
		Map<String, Object> resultValue = new HashMap();
		resultValue.put("result", service.delPdBoard(param));
		return resultValue;
	}
	
	// ----------------------------스토어 스크랩----------------------------//
	@ResponseBody
	@GetMapping("/scrap")
	public Map<String, Object> scrap(@RequestParam int iProduct, @RequestParam int scrapChk) {
		Map<String, Object> resultValue = new HashMap();
		StoreDTO dto = new StoreDTO();
		dto.setiProduct(iProduct);
		dto.setScrapChk(scrapChk);
		
		resultValue.put("result", service.chkScrap(dto));
		return resultValue;
	}
	
	// ----------------------------카트----------------------------//
	
	@ResponseBody
	@PostMapping("/cart")
	public int cart(StoreDTO param) {
		return service.addCart(param); 
	}
}
