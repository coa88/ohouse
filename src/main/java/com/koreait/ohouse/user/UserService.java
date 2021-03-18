package com.koreait.ohouse.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.UserEntity;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;

	@Autowired
	private HttpSession hs;

	public int insUser(UserEntity p) {
		String encryptUserPw = SecurityUtils.hashPassword(p.getUserPw());
		p.setEmailId(p.getEmailId());
		p.setUserPw(encryptUserPw);
		return mapper.insUser(p);

	}

	public UserEntity selUser(UserEntity p) {
		return mapper.selUser(p);
	}

	public int updUser(UserEntity param) {
		return mapper.updUser(param);
	}

	public int delUser(UserEntity p) {
		return mapper.delUser(p);
	}
	
	

	
	
	// 1: 로그인 성공 2: 아이디 없음 3: 비밀번호 틀림
	public int login(UserEntity param, HttpSession hs) {
		
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

	// 회원가입 별명 체크
	public int nmChk(UserEntity p) {
		return mapper.nmChk(p) == null ? 0 : 1;
	}

	
	
}
