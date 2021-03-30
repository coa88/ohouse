package com.koreait.ohouse.store;

import java.util.ArrayList;
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
import com.koreait.ohouse.model.PagingDTO;
import com.koreait.ohouse.model.StoreCategoryEntity;
import com.koreait.ohouse.model.StoreDTO;
import com.koreait.ohouse.model.StoreEntity;
import com.koreait.ohouse.model.StorePhotoEntity;
import com.koreait.ohouse.model.StoreSubPhotoEntity;
import com.koreait.ohouse.utils.MyFileUtils;
import com.koreait.ohouse.utils.PagingUtils;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	final StoreMapper mapper;
	final private HttpSession hs;
	final MyFileUtils myFileUtils;
	final PagingUtils pagingUtils;
	 
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
	
	public StoreCategoryEntity selPdCategory(StoreDTO param) {	// 카테고리 선택
		StoreCategoryEntity entity = new StoreCategoryEntity();
		if(param.getCategory() == 0) {
			param.setCategory(1);
		}
		entity.setiCategory(param.getCategory());
		return mapper.selPdCategory(entity);
	}
	
	public List<StoreCategoryEntity> selPdCategoryList() { // 카테고리 리스트
		return mapper.selPdCategoryList();
	}
	
	public StoreDTO selPdBoard(StoreDTO param) { // 게시물 선택
		return mapper.selPdBoard(param); 
	}
	
	public PagingDTO selPdBoardList(StoreDTO param) { // 게시물리스트
		if(param.getCategory() == 0) { // 카테고리를 선택하지않으면 1을 선택
			param.setCategory(1);
		}
		if(param.getRecordCntPerPage() == 0) { // 게시물을 출력갯수 지정
			param.setRecordCntPerPage(9);
		}
		if(param.getPage() == 0) { //선택된 페이지가 없으면 1을 선택
			param.setPage(1);
		}		
		// 선택된페이지가 몇번게시물인지 계산
		int sIdx = (param.getPage() - 1) * param.getRecordCntPerPage(); 
		param.setsIdx(sIdx);
		
		PagingDTO dto = new PagingDTO();
		dto.setPage(param.getPage());
		dto.setRecordCntPerPage(param.getRecordCntPerPage());
		dto.setList(mapper.selPdBoardList(param));
		dto.setMaxPageNum(mapper.selMaxPageNum(param));
		dto.setPage(param.getPage());
		
		return pagingUtils.pageControll(dto);
	}
	
	public List<StorePhotoEntity> selPdPhotoList(StoreDTO param) { //상품대표사진
		StorePhotoEntity photoList = new StorePhotoEntity();
		photoList.setiProduct(param.getiProduct());
		return mapper.selPdPhotoList(photoList);
	}
	
	
	public int delPdBoard(StoreDTO param) { // 삭제
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setiUser(i_user);
		
		String path = "/resources/img/store/board/" + param.getiProduct();
		myFileUtils.delFolder(path);
		
		//TODO: 리뷰 지우기
		mapper.delPdPhoto(param);
		mapper.delPdSubPhoto(param);
		return mapper.delPdBoard(param);
	}
}
