package com.koreait.ohouse.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("pagingDTO")
public class PagingDTO {
	private int side_num; //양쪽에 보여줄 페이지갯수
	private int page; // 현재 선택된 페이지
	private int maxPageNum; // 게시물 전체 페이지수
	private int startPage; // 시작페이지
	private int endPage;  // 범위내의 마지막 페이지
	private String searchText;  // 범위내의 마지막 페이지
	private List<CommunityDTO> cmList; // select한 게시물의 정보(커뮤니티)
	private List<StoreDTO> pdList; // select한 게시물의 정보(스토어)
	
	
	public int getSide_num() {
		return side_num;
	}
	public void setSide_num(int side_num) {
		this.side_num = side_num;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
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
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<CommunityDTO> getCmList() {
		return cmList;
	}
	public void setCmList(List<CommunityDTO> cmList) {
		this.cmList = cmList;
	}
	public List<StoreDTO> getPdList() {
		return pdList;
	}
	public void setPdList(List<StoreDTO> pdList) {
		this.pdList = pdList;
	}
	
}
