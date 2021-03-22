package com.koreait.ohouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {

	int insUser(UserEntity p);

	UserEntity selUser(UserEntity p);

	int updUser(UserEntity p);

	int delUser(UserEntity p);
	
	int changePw(UserEntity p);

	// 회원가입 중복 체크
	UserEntity emailIdChk(UserEntity p);

	UserEntity nmChk(UserEntity p);

}
