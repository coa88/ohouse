package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("UserEntity")
public class UserEntity {
	private int i_user;
	private String email_id;
	private String user_pw;
	private String nm;
	private int gender;
	private String ph;
	
	private String r_dt;
	private String profile_img;
	private String user_rank;

}
