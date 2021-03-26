package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("CommunityDTO")
public class CommunityDTO extends CommunityEntity {
	private String[] src;
	private MultipartFile file;
	private String nm;
	private String profileImg;
	private int favoriteCnt;
	private int scrapCnt;
	private int cmtCnt;
	private int boardCnt;
	

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public String[] getSrc() {
		return src;
	}

	public void setSrc(String[] src) {
		this.src = src;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public int getFavoriteCnt() {
		return favoriteCnt;
	}

	public void setFavoriteCnt(int favoriteCnt) {
		this.favoriteCnt = favoriteCnt;
	}

	public int getScrapCnt() {
		return scrapCnt;
	}

	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}

	public int getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	
	
}
