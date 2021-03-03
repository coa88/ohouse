package com.koreait.ohouse.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.StoreEntity;

@Mapper
public interface StoreMapper {
	int insPdBoard(StoreEntity param);
	StoreEntity selPdBoard(StoreEntity param);
	List<StoreEntity> selPdBoardList(StoreEntity param);
	int updPdBoard(StoreEntity param);
	int delPdBoard(StoreEntity param);
}
