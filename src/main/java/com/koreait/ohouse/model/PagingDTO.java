package com.koreait.ohouse.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("pagingDTO")
public class PagingDTO {
	private int page; // 현재 선택된 페이지
	private int recordCntPerPage; // 게시물을 보여주는 갯수
	private int maxPageNum; // 게시물 전체 페이지수
	private List<StoreDTO> list; // select한 게시물의 정보
	private int startPage; // 시작페이지
	private int endPage;  // 범위내의 마지막 페이지
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRecordCntPerPage() {
		return recordCntPerPage;
	}
	public void setRecordCntPerPage(int recordCntPerPage) {
		this.recordCntPerPage = recordCntPerPage;
	}
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	public List<StoreDTO> getList() {
		return list;
	}
	public void setList(List<StoreDTO> list) {
		this.list = list;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
