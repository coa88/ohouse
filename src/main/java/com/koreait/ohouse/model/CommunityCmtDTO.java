package com.koreait.ohouse.model;

public class CommunityCmtDTO extends CommunityCmtEntity {
	private String nm;
	private String profileImg;
	private int favoriteCnt;
	private int isMycmt;

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getFavoriteCnt() {
		return favoriteCnt;
	}

	public void setFavoriteCnt(int favoriteCnt) {
		this.favoriteCnt = favoriteCnt;
	}

	public int getIsMycmt() {
		return isMycmt;
	}

	public void setIsMycmt(int isMycmt) {
		this.isMycmt = isMycmt;
	}

}
