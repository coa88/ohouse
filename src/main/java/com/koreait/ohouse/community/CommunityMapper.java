package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;

@Mapper
public interface CommunityMapper {
	int insBoard(CommunityDTO param);
	int insCmPhoto(CommunityDTO param);
	
	List<CommunityEntity> selBoardList(CommunityEntity param);

	int updBoard(CommunityEntity param);

	int delBoard(CommunityEntity param);
}
