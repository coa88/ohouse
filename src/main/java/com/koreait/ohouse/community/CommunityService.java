package com.koreait.ohouse.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.common.SecurityUtils;
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
	
	public String saveBoardImg(MultipartFile img) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		String path = "/resources/img/community/temp/" + i_user;
		try {
			String fileNm = myFileUtils.transferTo(img, path);
			return path + "/" + fileNm;
		} catch(Exception e) {
			return null;
		}
	}
	
	public int insBoard(CommunityDTO param) {
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
			String moveSrc = originSrc.replace("/temp/" + i_user, "/board/" + param.getiBoard());
			myFileUtils.moveFile(originSrc, moveSrc);					
			
			ctnt = ctnt.replace(originSrc, moveSrc);
			
			//img insert
			String saveImg = moveSrc.substring(moveSrc.lastIndexOf("/") + 1);
			cmPhotoEntity.setCommunityImg(saveImg);
			mapper.insBoardImg(cmPhotoEntity);
		}
		
		
		param.setCtnt(ctnt);
		return mapper.updBoard(param);
	}
	
	public CommunityDTO selCmBoard(CommunityDTO param) {
		return mapper.selCmBoard(param);
	}
	
	public List<CommunityDTO> selCmBoardList(CommunityDTO param) {
		param.setTyp(1);
		param.setSecTyp(2);
		
		return mapper.selCmBoardList(param);
	}
	
}
