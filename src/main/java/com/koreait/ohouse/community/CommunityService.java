package com.koreait.ohouse.community;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
import com.koreait.ohouse.model.CommunityCmtDTO;
import com.koreait.ohouse.model.CommunityCmtEntity;
import com.koreait.ohouse.model.CommunityDTO;
import com.koreait.ohouse.model.CommunityPhotoEntity;
import com.koreait.ohouse.utils.MyFileUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityService {
	final private HttpSession hs;
	final CommunityMapper mapper; 
	final MyFileUtils myFileUtils;
	
	public int insBoard(CommunityDTO param) { //글쓰기
		// 0:유저pk없음 1:성공 2:파일없음 
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setiUser(i_user);
		if(i_user < 1) { // 유저없음
			return 0;
		}
		mapper.insBoard(param); // pk값을 얻기위해 먼저 생성
		
	
		//썸네일이미지 
		MultipartFile img = param.getFile();
		try {
			String folder = "/resources/img/community/board/" + param.getiBoard();		
			String fileNm = myFileUtils.transferTo(img, folder);
			param.setBoardImg(fileNm);
		} catch(Exception e) {
			return 2;
		}
		
		//글 내용에 img 들어간 부분을 뽑아내서 임시 폴더에 있는 이미지들을 모두 옮겨주고 내용에 있는 img src 주소값도 변경한다.
		String ctnt = param.getCtnt();  
		Document doc = Jsoup.parseBodyFragment(ctnt);
		Elements imgs = doc.getElementsByTag("img");
		
		
		CommunityPhotoEntity cmPhotoEntity = new CommunityPhotoEntity();
		cmPhotoEntity.setiBoard(param.getiBoard());;
		
		for(Element ele : imgs) {
			String originSrc = ele.attr("src");
			String moveSrc = originSrc.replace("/temp/" + i_user, "/community"+"/board/" + param.getiBoard());
			myFileUtils.moveFile(originSrc, moveSrc);					
			
			ctnt = ctnt.replace(originSrc, moveSrc);
			
			//img insert
			String saveImg = moveSrc.substring(moveSrc.lastIndexOf("/") + 1);
			cmPhotoEntity.setCommunityImg(saveImg);
			mapper.insBoardImg(cmPhotoEntity);
		}
		
		
		param.setCtnt(ctnt);
		return mapper.updCmBoard(param);
	}
	
	public CommunityDTO selCmBoard(CommunityDTO param) { // 게시물 선택
		return mapper.selCmBoard(param);
	}
	
	public List<CommunityDTO> selCmBoardList(CommunityDTO param) { // 리스트 뿌리기
		
		return mapper.selCmBoardList(param);
	}
	
	public int updCmBoard(CommunityDTO param) { // 수정
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setiUser(i_user);
		String path = "/resources/img/community/board/";
		String tempPath = "/resources/img/temp/";
		CommunityDTO dto = mapper.selCmBoard(param);
	
		if(i_user != dto.getiUser()) { //글쓴이 다름
			return 2;
		}
		
		//썸네일이미지 
		if(param.getFile() != null) {
			MultipartFile img = param.getFile();
			try {
				String folder = path + param.getiBoard();		
				String fileNm = myFileUtils.transferTo(img, folder);
				myFileUtils.delFile(folder, dto.getBoardImg());
				param.setBoardImg(fileNm);
			} catch(Exception e) {
				return 3;
			}
		}
		
		//글 내용에 img 들어간 부분을 뽑아내서 임시 폴더에 있는 이미지들을 모두 옮겨주고 내용에 있는 img src 주소값도 변경한다.
		String ctnt = param.getCtnt();  
		Document doc = Jsoup.parseBodyFragment(ctnt);
		Elements imgs = doc.getElementsByTag("img");
		
		CommunityPhotoEntity cmPhotoEntity = new CommunityPhotoEntity();
		cmPhotoEntity.setiBoard(param.getiBoard());
		
		mapper.delCmPhoto(param);// DB에 저장된 값 삭제
		
		for(Element ele : imgs) {
			String originSrc = ele.attr("src");
			String moveSrc = originSrc.replace("/temp/" + i_user, "/community"+"/board/" + param.getiBoard());
			String[] arrSrc = originSrc.split("/");
			String pathFileNm = arrSrc[arrSrc.length-1];
			File file = new File(myFileUtils.getRealPath(tempPath + i_user),pathFileNm);
			List<String> aa = new ArrayList<String>();

			if(file.exists()) {
				myFileUtils.moveFile(originSrc, moveSrc);
				ctnt = ctnt.replace(originSrc, moveSrc);
				param.setCtnt(ctnt);
			}
			
			//img insert
			String saveImg = moveSrc.substring(moveSrc.lastIndexOf("/") + 1);
			cmPhotoEntity.setCommunityImg(saveImg);
			mapper.insBoardImg(cmPhotoEntity); // DB에 파일이름 등록
		}
		
		for(int i=0;i < param.getSrc().length; i++) {
			String[] arrSrc = param.getSrc()[i].split("/");
			String pathFileNm = arrSrc[arrSrc.length-1];
			cmPhotoEntity.setCommunityImg(pathFileNm);

			
			if(mapper.selCmPhoto(cmPhotoEntity) == null) {	// 검색결과가 null이면 삭제
				System.out.println("result");
				myFileUtils.delFile(param.getSrc()[i]);					
			}
		}
		
		return mapper.updCmBoard(param);
	}
	
	public int delCmBoard(CommunityDTO param) { // 삭제
		int i_user = SecurityUtils.getLoginUserPk(hs);
		CommunityDTO dto = mapper.selCmBoard(param);
		
		if(i_user != dto.getiUser()) { //글쓴이 다름
			return 2;
		}
		
		param.setiUser(i_user);

		String path = "/resources/img/community/board/" + param.getiBoard();
		myFileUtils.delFolder(path);
		mapper.delCmPhoto(param);
		return mapper.delCmBoard(param);
	}
	
	// ----------------------------CMT----------------------------//
	
	public int insCmt(CommunityCmtEntity p) {
		return mapper.insCmt(p);
	}
	
	public List<CommunityCmtDTO> selCmtList(CommunityCmtDTO p) {
		return mapper.selCmtList(p);
	}
	
	public int delCmt(CommunityCmtEntity p) {
		return mapper.delCmt(p);
	}
}
