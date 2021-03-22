package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("UserDTO")
public class UserDTO extends UserEntity {
	
	private String currentPw;
	
	public String getCurrentPw() {
		return currentPw;
	}
	public void setCurrentPw(String currentPw) {
		this.currentPw = currentPw;
	}
	
}
