package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityCmtDTO;

import com.koreait.ohouse.model.CommunityCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityPhotoEntity;

@Mapper
public interface CommunityMapper {
	int insCmBoard(CommunityDTO param);

	int insCmBoardImg(CommunityPhotoEntity param);

	CommunityDTO selCmBoard(CommunityDTO param);

	List<CommunityDTO> selCmBoardList(CommunityDTO param);
	
	CommunityPhotoEntity selCmPhoto(CommunityPhotoEntity param);

	int updCmBoard(CommunityDTO param);

	int delCmBoard(CommunityDTO param);

	int delCmPhoto(CommunityDTO param);

	// ----------------------------커뮤니티 댓글----------------------------//

	int insCmt(CommunityCmtEntity p);

	List<CommunityCmtDTO> selCmtList(CommunityCmtDTO p);
	
	int delCmt(CommunityCmtEntity p);
	
	// ----------------------------커뮤니티 대댓글----------------------------//
	int insReCmt(CommunityCmtEntity p);
}
