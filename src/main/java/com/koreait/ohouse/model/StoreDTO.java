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
	private int currentPageNo; // 현재 페이지 번호
	private int recordsPerPage; // 출력할 데이터 개수
	private int pageSize; // 하단에 출력할 페이지길이

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
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	
	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
