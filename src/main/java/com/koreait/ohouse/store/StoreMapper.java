package com.koreait.ohouse.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.PagingDTO;
import com.koreait.ohouse.model.StoreCategoryEntity;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.StorePhotoEntity;
import com.koreait.ohouse.model.StoreSubPhotoEntity;

@Mapper
public interface StoreMapper {
	int insPdBoard(StoreDTO param); //제품등록
	
	StoreCategoryEntity selPdCategory(StoreCategoryEntity param);
	List<StoreCategoryEntity> selPdCategoryList(); //카테고리 리스트
	
	StoreDTO selPdBoard(StoreDTO param); //제품선택
	List<StoreDTO> selPdBoardList(StoreDTO param); //제품리스트
	List<StoreDTO> selPdBoardSales(StoreDTO param); //세일제품 리스트
	int selPdMaxPageNum(StoreDTO param); // 최대페이지 구하는 쿼리문
	List<StoreDTO> selPdSearchList(PagingDTO param); //검색리스트
	
	int updPdBoard(StoreDTO param); //수정
	
	int delPdBoard(StoreDTO param); //제품 삭제
	
	// 사진관련
	int insPdPhoto(StorePhotoEntity param); // 제품사진 DB저장
	int insPdSubPhoto(StoreSubPhotoEntity param); // 본문사진 DB저장
	
	List<StorePhotoEntity> selPdPhotoList(StorePhotoEntity param); // 제품사진 리스트
	
	int delPdPhoto(StoreDTO param); // 사진삭제
	int delPdSubPhoto(StoreDTO param);
	
	// ----------------------------스크랩----------------------------//
	int insPdScrap(StoreDTO param);
	int selPdScrap(StoreDTO param);
	int delPdScrap(StoreDTO param);
	
	// ----------------------------카트----------------------------//
	int insCart(StoreDTO param);
	int updCart(StoreDTO param);
}
