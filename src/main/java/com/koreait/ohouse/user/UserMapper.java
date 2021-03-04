package com.koreait.ohouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {

	int insUser(UserEntity p);

	UserEntity selUser(UserEntity p);

	UserEntity updUser(UserEntity p);

	int delUser(UserEntity p);

}
