package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("MenuEntity")
public class MenuEntity {
	private int menuTyp;
	private String menuAddress;
	private String menuNm;
	private int menuOrderby;
	private int submenuTyp;
	private String submenuAddress;
	private String submenuNm;
	private int submenuOrderby;
	
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
	public int getSubmenuTyp() {
		return submenuTyp;
	}
	public void setSubmenuTyp(int submenuTyp) {
		this.submenuTyp = submenuTyp;
	}
	public String getSubmenuAddress() {
		return submenuAddress;
	}
	public void setSubmenuAddress(String submenuAddress) {
		this.submenuAddress = submenuAddress;
	}
	public String getSubmenuNm() {
		return submenuNm;
	}
	public void setSubmenuNm(String submenuNm) {
		this.submenuNm = submenuNm;
	}
	public int getSubmenuOrderby() {
		return submenuOrderby;
	}
	public void setSubmenuOrderby(int submenuOrderby) {
		this.submenuOrderby = submenuOrderby;
	}
	
	

	
	
}
