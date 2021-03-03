package com.koreait.ohouse.user;

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

	public int insUser(UserEntity p) {
		return mapper.insUser(p);
	}
	public UserEntity selUser(UserEntity p) {
		return mapper.selUser(p);
	}
	public int delUser(UserEntity p) {
		return mapper.delUser(p);
	}
	
	
}
