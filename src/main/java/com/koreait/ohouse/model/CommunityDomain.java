package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("CommunityDomain")
public class CommunityDomain extends CommunityEntity {
	private int favoriteCnt;
	private int scrapCnt;
	private int cmtCnt;
	
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
	
	
}
