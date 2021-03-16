package com.koreait.ohouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {

	int insUser(UserEntity p);

	UserEntity selUser(UserEntity p);

	int updUser(UserEntity p);

	int delUser(UserEntity p);
	
	// 회원가입 별명 체크
	UserEntity nmChk(UserEntity p);

}
