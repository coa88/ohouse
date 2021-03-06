package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("MenuEntity")
public class MenuEntity {
	private int topTyp;
	private int menuTyp;
	private String menuAddress;
	private String menuNm;
	private int menuOrderby;
	
	public int getTopTyp() {
		return topTyp;
	}
	public void setTopTyp(int topTyp) {
		this.topTyp = topTyp;
	}
	public int getMenuTyp() {
		return menuTyp;
	}
	public void setMenuTyp(int menuTyp) {
		this.menuTyp = menuTyp;
	}
	public String getMenuAddress() {
		return menuAddress;
	}
	public void setMenuAddress(String menuAddress) {
		this.menuAddress = menuAddress;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public int getMenuOrderby() {
		return menuOrderby;
	}
	public void setMenuOrderby(int menuOrderby) {
		this.menuOrderby = menuOrderby;
	}
	

	
	
}
