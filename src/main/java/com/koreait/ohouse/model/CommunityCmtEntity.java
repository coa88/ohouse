package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("CommunityCmtEntity")
public class CommunityCmtEntity {
	private int iCmt;
	private int cmtGroup;
	private int iBoard;
	private int iUser;
	private String ctnt;
	private String cmtDt;

	public int getiCmt() {
		return iCmt;
	}

	public void setiCmt(int iCmt) {
		this.iCmt = iCmt;
	}

	public int getcmtGroup() {
		return cmtGroup;
	}

	public void setcmtGroup(int cmtGroup) {
		this.cmtGroup = cmtGroup;
	}

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

	public String getctnt() {
		return ctnt;
	}

	public void setctnt(String ctnt) {
		this.ctnt = ctnt;
	}

	public String getcmtDt() {
		return cmtDt;
	}

	public void setcmtDt(String cmtDt) {
		this.cmtDt = cmtDt;
	}

}
