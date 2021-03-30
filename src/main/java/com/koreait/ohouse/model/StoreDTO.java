package com.koreait.ohouse.model;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("StoreDTO")
public class StoreDTO extends StoreEntity {
	private MultipartFile[] file;
	private String pdImg;
	private int productCnt;
	private int reviewCnt;
	private int starRt;
	// 페이징
	private int recordCntPerPage; //게시물을 몇개씩 출력하는지 정함.
	private int sIdx; // 현재 선택된페이지 
	private int page; // 선택된 페이지

	
	
	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	public String getPdImg() {
		return pdImg;
	}

	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
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

	//페이징
	public int getRecordCntPerPage() {
		return recordCntPerPage;
	}
	
	public void setRecordCntPerPage(int recordCntPerPage) {
		this.recordCntPerPage = recordCntPerPage;
	}
	
	public int getsIdx() {
		return sIdx;
	}
	
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	
}
