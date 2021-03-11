package com.koreait.ohouse.community;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.UserEntity;
import com.koreait.ohouse.utils.ImgUploadUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityService {
	final private HttpSession hs;
	final ImgUploadUtils imgUtils;
	final CommunityMapper mapper; 
	
	public int insBoard(CommunityDTO param, MultipartFile img) {
		// 0:유저pk없음 1:성공 2:파일없음 
		int i_user = SecurityUtils.getLoginUserPk(hs);
		
		if(i_user < 1) { // 유저없음
			return 0;
		}
		
		try {	
			String folder = "/resources/img/community/user/" + i_user;
			MultipartFile file = img;
			String fileNm = imgUtils.saveFile(file, folder);
			
			if(fileNm == null) { //파일없음
				return 2;
			}
			
			param.setiUser(i_user);
			param.setBoardImg(fileNm);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return mapper.insBoard(param);
	}
}
