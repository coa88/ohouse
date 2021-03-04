package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("CommunityEntity")
public class CommunityEntity {
	private int iBoard;
	private int iUser;
	private int typ;
	private int secTyp;
	private int seq;
	private String title;
	private String ctnt;
	private String rDt;
	private int hits;
	private String boardImg;
	
	public int getiBoard() {
		return iBoard;
	}
	public void setiBoard(int iBoard) {
		this.iBoard = iBoard;
	}
	public int getiUser() {
		return iUser;
	}
	public void setiUser(int iUser) {
		this.iUser = iUser;
	}
	public int getTyp() {
		return typ;
	}
	public void setTyp(int typ) {
		this.typ = typ;
	}
	public int getSecTyp() {
		return secTyp;
	}
	public void setSecTyp(int secTyp) {
		this.secTyp = secTyp;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	public String getrDt() {
		return rDt;
	}
	public void setrDt(String rDt) {
		this.rDt = rDt;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	
	
}
