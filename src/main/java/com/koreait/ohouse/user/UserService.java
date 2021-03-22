package com.koreait.ohouse.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.UserDTO;
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
	//유저 탈퇴
	public int delUser(UserEntity param) {
		param.setiUser(SecurityUtils.getLoginUserPk(hs));
		System.out.println(param.getiUser());
		return mapper.delUser(param);
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
