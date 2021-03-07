package com.koreait.ohouse.common;

import org.mindrot.jbcrypt.BCrypt;

public class SecurityUtils {
	public static String genSalt() {
		return BCrypt.gensalt();
	}

	public static String hashPassword(String pw, String salt) {
		return BCrypt.hashpw(pw, salt);
	}
}
