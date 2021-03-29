package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("StoreCategoryEntity")
public class StoreCategoryEntity {
	private int iCategory;
	private String categoryNm;
	private int categoryOderby;
	
	public int getiCategory() {
		return iCategory;
	}
	public void setiCategory(int iCategory) {
		this.iCategory = iCategory;
	}
	public String getCategoryNm() {
		return categoryNm;
	}
	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}
	public int getCategoryOderby() {
		return categoryOderby;
	}
	public void setCategoryOderby(int categoryOderby) {
		this.categoryOderby = categoryOderby;
	}
	
}
