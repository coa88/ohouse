package com.koreait.ohouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {
<<<<<<< HEAD
 
	int insUser(UserEntity p);
	UserEntity selUser(UserEntity p);
	UserEntity updUser(UserEntity p);
	int delUser(UserEntity p);
=======
>>>>>>> branch 'master' of https://github.com/coa88/ohouse.git

	int insUser(UserEntity p);

	UserEntity selUser(UserEntity p);

	int updUser(UserEntity p);

	int delUser(UserEntity p);

}
