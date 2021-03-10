package com.koreait.ohouse.common;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.koreait.ohouse.model.UserEntity;

public class SecurityUtils {
	public static String genSalt() {
		return BCrypt.gensalt();
	}

	public static String hashPassword(String pw) {
		return BCrypt.hashpw(pw, BCrypt.gensalt());
	}
	
	public static boolean chkPassword(String pw, String salt) {
		return BCrypt.checkpw(pw, salt);
	}
	public static UserEntity getLoginUser(HttpSession hs) {
		return (UserEntity)hs.getAttribute("loginUser");
	}
	
	public static int getLoginUserPk(HttpSession hs) {
		UserEntity loginUser = getLoginUser(hs);
		return loginUser == null ? 0 : loginUser.getiUser();
	}
	//로그인 상태면 t, 아니면 f
	public static boolean isLogin(HttpSession hs) {
		return getLoginUser(hs) !=null;
	}
	
}
