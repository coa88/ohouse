package com.koreait.ohouse.model;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO extends StoreEntity {
	private MultipartFile[] file;
	private int productCnt;
	private int reviewCnt;
	private int starRt;

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}

	public int getStarRt() {
		return starRt;
	}

	public void setStarRt(int starRt) {
		this.starRt = starRt;
	}

}
