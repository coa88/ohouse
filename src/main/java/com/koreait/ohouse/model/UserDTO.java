package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("UserDTO")
public class UserDTO extends UserEntity {
	
	private String currentPw;
	private MultipartFile file;
	private int favoriteChk;
	private int cmScrapChk;
	public int getFavoriteChk() {
		return favoriteChk;
	}
	public void setFavoriteChk(int favoriteChk) {
		this.favoriteChk = favoriteChk;
	}
	public int getCmScrapChk() {
		return cmScrapChk;
	}
	public void setCmScrapChk(int cmScrapChk) {
		this.cmScrapChk = cmScrapChk;
	}
	public int getPdScrapChk() {
		return pdScrapChk;
	}
	public void setPdScrapChk(int pdScrapChk) {
		this.pdScrapChk = pdScrapChk;
	}
	private int pdScrapChk;
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCurrentPw() {
		return currentPw;
	}
	public void setCurrentPw(String currentPw) {
		this.currentPw = currentPw;
	}
	
}
