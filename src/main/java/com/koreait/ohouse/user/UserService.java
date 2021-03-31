package com.koreait.ohouse.user;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.community.CommunityMapper;
import com.koreait.ohouse.model.UserDTO;
import com.koreait.ohouse.model.UserEntity;
import com.koreait.ohouse.utils.MyFileUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	final private UserMapper mapper;
	final private HttpSession hs;
	final MyFileUtils myFileUtils;

	public int insUser(UserDTO p) {
		String encryptUserPw = SecurityUtils.hashPassword(p.getUserPw());
		p.setEmailId(p.getEmailId());
		p.setUserPw(encryptUserPw);
		return mapper.insUser(p);

	}

	public UserEntity selUser(UserDTO p) {
		return mapper.selUser(p);
	}

	public int updUser(UserDTO param) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setiUser(i_user);
		String path = "/resources/img/user/";
		UserDTO dto = mapper.selUser(param); 
		
		if(param.getFile() == null) {
			param.setProfileImg(dto.getProfileImg());
		}
		if(param.getFile() != null) {
			//프로필 이미지 
			if(dto.getProfileImg() == null) {//db 저장된 이미지가 없다면 
				MultipartFile img = param.getFile();
				try {
					String folder = path + param.getiUser();		
					String fileNm = myFileUtils.transferTo(img, folder);
					System.out.println("filenm : " + fileNm);
					param.setProfileImg(fileNm);
				} catch(Exception e) {
					return 2;
				}
			}
			
			if(dto.getProfileImg() != null) { //db  이미지가 있다
				MultipartFile img = param.getFile();
				try {
					String folder = path + param.getiUser();		
					String fileNm = myFileUtils.transferTo(img, folder);
					System.out.println("filenm : " + fileNm);
					myFileUtils.delFile(folder, dto.getProfileImg());
					param.setProfileImg(fileNm);
				} catch(Exception e) {
					return 2;
				}
			}			
		}
		
	
		return mapper.updUser(param);
	}
	//유저 탈퇴
	public int delUser(UserDTO param) {
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		System.out.println(param.getiUser());
		return mapper.delUser(param);
	}

	// 1: 로그인 성공 2: 아이디 없음 3: 비밀번호 틀림
	public int login(UserDTO param, HttpSession hs) {

		UserEntity data = selUser(param);
		System.out.println(param.getiUser());
		if (data == null) {
			return 2;
		}

		boolean cryptLoginPw = SecurityUtils.chkPassword(param.getUserPw(), data.getUserPw());

		if (!cryptLoginPw) {
			return 3;
		}
		data.setUserPw(null);
		hs.setAttribute("loginUser", data);
		return 1;

	}
	//비밀번호 변경
	public int changePw(UserDTO param) {
		String curruntPw = param.getCurrentPw(); // 입력한 비밀번호 
		String userPw = param.getUserPw();
		
		// 현재비밀번호 확인 
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		UserEntity data = mapper.selUser(param);
		
		if(!SecurityUtils.chkPassword(curruntPw, data.getUserPw())) {
			System.out.println("비밀번호틀림 ");
			System.out.println(data.getiUser());
			System.out.println(param.getCurrentPw());
			System.out.println(param.getUserPw());
			return 0;
		}
		
		param.setUserPw(SecurityUtils.hashPassword(userPw));
		
		return mapper.changePw(param);
	}
	
	


	// 회원가입 중복 체크
	public int emailIdChk(UserEntity p) {
		return mapper.emailIdChk(p) == null ? 0 : 1;
	}

	public int nmChk(UserEntity p) {
		return mapper.nmChk(p) == null ? 0 : 1;
	}

	
	
	
	
}
