package com.koreait.ohouse.user;

import javax.servlet.http.HttpServletRequest;
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

	@Autowired
	private HttpServletRequest request;

	public int insUser(UserEntity p) {
		String emailAdr = request.getParameter("emailAdr");
		String emailId = p.getEmailId() + emailAdr;

		String encryptUserPw = SecurityUtils.hashPassword(p.getUserPw());
		p.setEmailId(emailId);
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
	//1: 로그인 성공 2: 아이디 없음 3: 비밀번호 틀림 
	public int login(UserEntity param , HttpSession hs) {
		
		UserEntity data = selUser(param);
		System.out.println(param.getNm());
		
//		if(data == null) {
//			System.out.println("아이디 없음 ");
//			return 2;
//		}
		
		boolean cryptLoginPw = SecurityUtils.chkPassword(param.getUserPw(), data.getUserPw());
		
		if(!cryptLoginPw) {
			System.out.println("비밀번호 틀림 ");
			return 3;
		}
		data.setUserPw(null);
		hs.setAttribute("loginUser", data);
			return 1;
	}
	
}
