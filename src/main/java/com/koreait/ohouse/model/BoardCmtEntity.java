package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("BoardCmtEntity")
public class BoardCmtEntity {
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

	public int getCmtGroup() {
		return cmtGroup;
	}

	public void setCmtGroup(int cmtGroup) {
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

	public String getCtnt() {
		return ctnt;
	}

	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}

	public String getCmtDt() {
		return cmtDt;
	}

	public void setCmtDt(String cmtDt) {
		this.cmtDt = cmtDt;
	}

}
