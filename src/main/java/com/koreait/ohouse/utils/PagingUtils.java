package com.koreait.ohouse.utils;

import org.springframework.stereotype.Component;

import com.koreait.ohouse.model.PagingDTO;

@Component
public class PagingUtils {
	public PagingDTO pageControll(PagingDTO dto) {
		
		int SIDE_NUM = 4; //양쪽에 몇개씩 보일지
		int pageLen = SIDE_NUM * 2; // 페이지길이
		int maxPage = dto.getMaxPageNum();
		
		int startPage = dto.getPage() - SIDE_NUM; // 선택된페이지 - SIDE_NUM만큼표시
		int endPage = dto.getPage() + SIDE_NUM;  // 선택된페이지 + SIDE_NUM만큼표시
		
		if(pageLen < maxPage) {	 // 페이지길이가 최대페이지보다 낮을때
			if(startPage < 1) { // 시작페이지가 1보다 낮으면 1
				startPage = 1;
			} else if(startPage >= maxPage - pageLen) { // 시작페이지가 최대페이지-페이지길이와 같거나 클때
				startPage = maxPage - pageLen;
			}
			
			if(endPage > maxPage) { // 마지막페이지가 최대페이지보다 클때
				endPage = maxPage;
			} else if(endPage <= pageLen) { // 마지막페이지가 페이지길이보다 작거나 같을때
				endPage = pageLen + 1;
			}
		} else {
			startPage = 1;
			endPage = maxPage;
		}
		
		dto.setStartPage(startPage);
		dto.setEndPage(endPage);		
		
		return dto; 
	}
}
