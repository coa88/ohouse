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
	private int favoriteChk;
	private int scrapChk;
	
	private String cmtNm;
	private String cmtCtnt;
	
	
	// 페이징
	private int recordCntPerPage; //게시물을 몇개씩 출력하는지 정함.
	private int sIdx; // 현재 선택된페이지 
	private int page; // 선택된 페이지

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

	//페이징
	public int getRecordCntPerPage() {
		return recordCntPerPage;
	}

	public void setRecordCntPerPage(int recordCntPerPage) {
		this.recordCntPerPage = recordCntPerPage;
	}

	public int getsIdx() {
		return sIdx;
	}

	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public int getFavoriteChk() {
		return favoriteChk;
	}

	public void setFavoriteChk(int favoriteChk) {
		this.favoriteChk = favoriteChk;
	}

	public int getScrapChk() {
		return scrapChk;
	}

	public void setScrapChk(int scrapChk) {
		this.scrapChk = scrapChk;
	}

	public String getCmtNm() {
		return cmtNm;
	}

	public void setCmtNm(String cmtNm) {
		this.cmtNm = cmtNm;
	}

	public String getCmtCtnt() {
		return cmtCtnt;
	}

	public void setCmtCtnt(String cmtCtnt) {
		this.cmtCtnt = cmtCtnt;
	}

}
