package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityCmtDTO;

import com.koreait.ohouse.model.CommunityCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityPhotoEntity;

@Mapper
public interface CommunityMapper {
	int insBoard(CommunityDTO param);

	int insBoardImg(CommunityPhotoEntity param);

	CommunityDTO selCmBoard(CommunityDTO param);

	List<CommunityDTO> selCmBoardList(CommunityDTO param);
	
	List<CommunityPhotoEntity> selCmPhotoList(CommunityPhotoEntity param);

	CommunityPhotoEntity selCmPhoto(CommunityPhotoEntity param);

	int updCmBoard(CommunityDTO param);

	int delCmBoard(CommunityDTO param);

	int delCmPhoto(CommunityDTO param);

	// ----------------------------CMT----------------------------//

	int insCmt(CommunityCmtEntity p);

	List<CommunityCmtDTO> selCmtList(CommunityDTO p);
}
