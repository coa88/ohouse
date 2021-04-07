package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityCmtDTO;

import com.koreait.ohouse.model.CommunityCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityPhotoEntity;
import com.koreait.ohouse.model.PagingDTO;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface CommunityMapper {
	int insCmBoard(CommunityDTO param);
	int insCmBoardImg(CommunityPhotoEntity param);

	CommunityDTO selCmBoard(CommunityDTO param);
	List<CommunityDTO> selCmBoardList(CommunityDTO param);
	CommunityPhotoEntity selCmPhoto(CommunityPhotoEntity param);
	int selCmMaxPageNum(CommunityDTO param);
	List<CommunityDTO> selCmBoardBest(CommunityDTO param);
	List<CommunityDTO> selCmSearchList(PagingDTO param); // 검색리스트
	
	int updCmBoard(CommunityDTO param);
	int hitsCmBoard(CommunityDTO param);

	int delCmBoard(CommunityDTO param);
	int delCmPhoto(CommunityDTO param);

	// ----------------------------좋아요----------------------------//
	
	int insFavorite(CommunityDTO param);
	int selFavorite(CommunityDTO param);
	int delFavorite(CommunityDTO param);
	int delFavoriteAll(CommunityDTO param);
	
	// ----------------------------스크랩----------------------------//
	
	int insScrap(CommunityDTO param);
	int selScrap(CommunityDTO param);
	int delScrap(CommunityDTO param);
	int delScrapAll(CommunityDTO param);

	// ----------------------------커뮤니티 댓글----------------------------//

	int insCmt(CommunityCmtEntity p);

	List<CommunityCmtDTO> selCmtList(CommunityCmtDTO p);
	
	int delCmt(CommunityCmtEntity p);
	int delCmtAll(CommunityDTO p);
	
	// ----------------------------커뮤니티 대댓글----------------------------//
	int insReCmt(CommunityCmtEntity p);
	
	List<UserEntity> userInfo(UserEntity p);
	
}
