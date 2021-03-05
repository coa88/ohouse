package com.koreait.ohouse.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		String email_id = p.getEmailId() + emailAdr;
		String userPw = request.getParameter("user_pw");
		p.setEmailId(email_id);
		p.setUserPw(userPw);
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

}
