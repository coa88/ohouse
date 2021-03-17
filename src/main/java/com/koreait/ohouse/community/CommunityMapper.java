package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityDomain;
import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.CommunityPhotoEntity;

@Mapper
public interface CommunityMapper {
	int insBoard(CommunityDTO param);
	
	int insBoardImg(CommunityPhotoEntity param);
	
	CommunityDomain selCmboard(CommunityDomain param);

	int updBoard(CommunityEntity param);

	int delBoard(CommunityEntity param);
}
