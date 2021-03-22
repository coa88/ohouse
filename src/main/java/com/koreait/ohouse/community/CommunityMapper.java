package com.koreait.ohouse.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.BoardCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityEntity;
import com.koreait.ohouse.model.CommunityPhotoEntity;

@Mapper
public interface CommunityMapper {
	int insBoard(CommunityDTO param);

	int insBoardImg(CommunityPhotoEntity param);

	CommunityDTO selCmBoard(CommunityDTO param);

	List<CommunityDTO> selCmBoardList(CommunityDTO param);

	int updCmBoard(CommunityDTO param);

	int delCmBoard(CommunityDTO param);

	// ----------------------------CMT----------------------------//

	int insCmt(BoardCmtEntity p);
}
