package com.koreait.ohouse.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.StoreCategoryEntity;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.StorePhotoEntity;
import com.koreait.ohouse.model.StoreSubPhotoEntity;

@Mapper
public interface StoreMapper {
	int insPdBoard(StoreDTO param);
	
	StoreCategoryEntity selPdCategory(StoreCategoryEntity param);
	List<StoreCategoryEntity> selPdCategoryList();
	StoreDTO selPdBoard(StoreDTO param);
	List<StoreDTO> selPdBoardList(StoreDTO param);
	int selPdMaxPageNum(StoreDTO param);
	
	int updPdBoard(StoreDTO param);
	
	int delPdBoard(StoreDTO param);
	
	// 사진관련
	int insPdPhoto(StorePhotoEntity param);
	int insPdSubPhoto(StoreSubPhotoEntity param);
	
	List<StorePhotoEntity> selPdPhotoList(StorePhotoEntity param);
	
	int delPdPhoto(StoreDTO param);
	int delPdSubPhoto(StoreDTO param);
}
