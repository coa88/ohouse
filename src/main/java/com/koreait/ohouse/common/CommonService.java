package com.koreait.ohouse.common;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.community.CommunityMapper;
import com.koreait.ohouse.utils.MyFileUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommonService {
	
	final private HttpSession hs;
	final MyFileUtils myFileUtils;

	public String saveBoardImg(MultipartFile img) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		String path = "/resources/img/temp/" + i_user;
		try {
			String fileNm = myFileUtils.transferTo(img, path);
			return path + "/" + fileNm;
		} catch(Exception e) {
			return null;
		}
	}
}
