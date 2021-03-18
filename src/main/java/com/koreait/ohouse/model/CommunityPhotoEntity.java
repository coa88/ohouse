package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("CommunityPhotoEntity")
public class CommunityPhotoEntity {

	private int iBoard;
	private int imgSeq;
	private String CommunityImg;
	
	public int getiBoard() {
		return iBoard;
	}
	public void setiBoard(int iBoard) {
		this.iBoard = iBoard;
	}
	public int getImgSeq() {
		return imgSeq;
	}
	public void setImgSeq(int imgSeq) {
		this.imgSeq = imgSeq;
	}
	public String getCommunityImg() {
		return CommunityImg;
	}
	public void setCommunityImg(String communityImg) {
		CommunityImg = communityImg;
	}
	
	
}
