package com.koreait.ohouse.store;

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
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.StoreEntity;
import com.koreait.ohouse.model.StorePhotoEntity;
import com.koreait.ohouse.model.StoreSubPhotoEntity;
import com.koreait.ohouse.utils.MyFileUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	final StoreMapper mapper;
	final private HttpSession hs;
	final MyFileUtils myFileUtils;
	 
	public int insPdBoard(StoreDTO param) { //상품등록
		// 0:유저pk없음 1:성공 2:파일없음 
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setiUser(i_user);
		if(i_user < 1) { // 유저없음
			return 0;
		}
		mapper.insPdBoard(param); // pk값을 얻기위해 먼저 생성
	
		//상품대표사진
		MultipartFile[] img = param.getFile();
		try { //상품대표사진테이블에 저장
			StorePhotoEntity photoParam = new StorePhotoEntity();
			photoParam.setiProduct(param.getiProduct());
			String folder = "/resources/img/store/board/" + param.getiProduct();		
			for(int i=0;i<img.length;i++) { 
				String fileNm = myFileUtils.transferTo(img[i], folder);
				photoParam.setPdImg(fileNm);
				mapper.insPdPhoto(photoParam);
			}
		} catch(Exception e) {
			return 2;
		}
		
		//글 내용에 img 들어간 부분을 뽑아내서 임시 폴더에 있는 이미지들을 모두 옮겨주고 내용에 있는 img src 주소값도 변경한다.
		String ctnt = param.getProductCtnt();  
		Document doc = Jsoup.parseBodyFragment(ctnt);
		Elements imgs = doc.getElementsByTag("img");
		
		StoreSubPhotoEntity StoreSubPhotoEntity = new StoreSubPhotoEntity();
		StoreSubPhotoEntity.setiProduct(param.getiProduct());;
		
		for(Element ele : imgs) {
			String originSrc = ele.attr("src");
			String moveSrc = originSrc.replace("/temp/" + i_user, "/store/board/" + param.getiProduct());
			myFileUtils.moveFile(originSrc, moveSrc);					
			
			ctnt = ctnt.replace(originSrc, moveSrc);
			
			//img insert
			String saveImg = moveSrc.substring(moveSrc.lastIndexOf("/") + 1);
			StoreSubPhotoEntity.setPdsubImg(saveImg);
			mapper.insPdSubPhoto(StoreSubPhotoEntity);
		}
		
		param.setProductCtnt(ctnt);
		return mapper.updPdBoard(param);
	}
	
	public StoreEntity selPdBoard(StoreDTO param) { // 게시물 선택
		return mapper.selPdBoard(param); 
	}
	
	public List<StoreDTO> selPdBoardList(StoreDTO param) { // 게시물 선택
		return mapper.selPdBoardList(param); 
	}
}
