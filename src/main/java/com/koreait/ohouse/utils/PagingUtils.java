package com.koreait.ohouse.utils;

import org.springframework.stereotype.Component;

import com.koreait.ohouse.model.PagingDTO;

@Component
public class PagingUtils {
	public PagingDTO pageControll(PagingDTO dto) {
		
		int SIDE_NUM = 4;
		int pageLen = SIDE_NUM * 2;
		int maxPage = dto.getMaxPageNum();
		
		int sPage = dto.getPage() - SIDE_NUM;
		int ePage = dto.getPage() + SIDE_NUM;
		
		if(pageLen < maxPage) {	
			if(sPage < 1) {
				sPage = 1;
			} else if(sPage >= maxPage - pageLen) {
				sPage = maxPage - pageLen;
			}
			
			if(ePage > maxPage) {
				ePage = maxPage;
			} else if(ePage <= pageLen) {
				ePage = pageLen + 1;
			}
		} else {
			sPage = 1;
			ePage = maxPage;
		}
		
		dto.setStartPage(sPage);
		dto.setEndPage(ePage);		
		
		return dto; 
	}
}
