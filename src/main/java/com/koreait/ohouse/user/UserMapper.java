package com.koreait.ohouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.UserDTO;
import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {

	int insUser(UserDTO p);

	UserDTO selUser(UserDTO p);

	int updUser(UserDTO p);

	int delUser(UserDTO p);
	
	int changePw(UserDTO p);
	
	int updProfileImg(UserDTO p);

	// 회원가입 중복 체크
	UserEntity emailIdChk(UserEntity p);

	UserEntity nmChk(UserEntity p);

}
