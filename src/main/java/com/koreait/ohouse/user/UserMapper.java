package com.koreait.ohouse.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreait.ohouse.model.CommunityCmtDTO;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.UserDTO;
import com.koreait.ohouse.model.UserEntity;

@Mapper
public interface UserMapper {

	int insUser(UserDTO p);

	UserDTO selUser(UserDTO p);

	int updUser(UserDTO p);

	int delUser(UserDTO p);
	
	int changePw(UserDTO p);
	
	int updProfileImg(UserDTO p);

	// 회원가입 중복 체크
	UserEntity emailIdChk(UserEntity p);

	UserEntity nmChk(UserEntity p);
	
	//유저 글쓴거 접근
	List<CommunityDTO> selUserBoardList(UserDTO p);
	
	//유저 댓글리스트 접근
	List<CommunityCmtDTO> selUserCmtList(UserDTO p);
	
	//유저 좋아요, 북마크 갯수접
	UserDTO userStateChk(UserDTO dto);

	//유저 커뮤니티 스크랩 
	List<CommunityDTO> selUserScrapCMList(UserDTO dto);
	//유저 스토어 스크랩 
	List<StoreDTO> selUserScrapSTList(UserDTO dto);

	//장바구니에 리스트 가져오기
	List<StoreDTO> selCartList(UserDTO dto);
	

}
