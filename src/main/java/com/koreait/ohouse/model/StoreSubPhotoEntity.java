package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("StoreSubPhotoEntity")
public class StoreSubPhotoEntity {
	private int iProduct;
	private int pdsubSeq;
	private String pdsubImg;
	
	public int getiProduct() {
		return iProduct;
	}
	public void setiProduct(int iProduct) {
		this.iProduct = iProduct;
	}
	public int getPdsubSeq() {
		return pdsubSeq;
	}
	public void setPdsubSeq(int pdsubSeq) {
		this.pdsubSeq = pdsubSeq;
	}
	public String getPdsubImg() {
		return pdsubImg;
	}
	public void setPdsubImg(String pdsubImg) {
		this.pdsubImg = pdsubImg;
	}
	
}
