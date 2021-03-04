package com.koreait.ohouse.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.ohouse.model.UserEntity;



@Service
public class UserService {
	@Autowired
	private UserMapper mapper;

	public int insUser(UserEntity param) {
		return mapper.insUser(param);
	}
	public UserEntity selUser(UserEntity param) {
		return mapper.selUser(param);
	}
	public int delUser(UserEntity param) {
		return mapper.delUser(param);
	}
	public UserEntity updUser(UserEntity param) {
		return mapper.updUser(param);
	}
	
	
}
