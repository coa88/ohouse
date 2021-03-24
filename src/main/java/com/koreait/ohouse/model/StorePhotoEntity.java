package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("StorePhotoEntity")
public class StorePhotoEntity {
	private int iProduct;
	private int pdimgSeq;
	private String pdImg;
	
	public int getiProduct() {
		return iProduct;
	}
	public void setiProduct(int iProduct) {
		this.iProduct = iProduct;
	}
	public int getPdimgSeq() {
		return pdimgSeq;
	}
	public void setPdimgSeq(int pdimgSeq) {
		this.pdimgSeq = pdimgSeq;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	
}
