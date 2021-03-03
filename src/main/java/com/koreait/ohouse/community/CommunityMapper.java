package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityEntity;

@Mapper
public interface CommunityMapper {
	int insBoard(CommunityEntity p);

	List<CommunityEntity> selBoardList(CommunityEntity p);

	int updBoard(CommunityEntity p);

	int delBoard(CommunityEntity p);
}
