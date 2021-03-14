package com.koreait.ohouse.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.ohouse.community.CommunityService;

import lombok.RequiredArgsConstructor;

import org.json.simple.JSONObject;

@Controller
@RequiredArgsConstructor
public class CkeditorUploadController {
	
	final private HttpSession hs;
	
	@RequestMapping(value="/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			 @RequestParam MultipartFile upload ) throws Exception{
		//CKEditor 에서 파일을 넘겨주는 이름이 upload 로 설정 되어 있다. 반드시 upload 로 설정
	
		Map<String, Object> returnMap = new HashMap<String, Object>();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		OutputStream out =null;
		PrintWriter printWriter =null;
		System.out.println("파일이름 : "+upload.getOriginalFilename());
		String fileName =upload.getOriginalFilename(); //첨부 파일 이름
		byte[] bytes =upload.getBytes(); //첨부파일을 바이트 배열로 저장
	    

		//String uploadPath ="업로드할 디렉토리 경로" + fileName; //물리적 실제 저장소
	    String uploadPath =UploadPath.path(request) +fileName;
		
	    out=new FileOutputStream(new File(uploadPath));
	    out.write(bytes); //서버에 파일 업로드
	    
	    printWriter=response.getWriter();
	    //URL 상에서 볼수 있는 이미지 경로
	    String fileUrl ="/resources/upload/"+ fileName;
	    
	    returnMap.put("fileUrl", "http://localhost:8090" + fileUrl); // JS로 보내줌
	    
	    JSONObject jobject = new JSONObject(returnMap); //JSON으로 파싱 
	    
	    printWriter.println(jobject); // json값을 response에 담아서 리턴
	    printWriter.flush(); // 닫기
	    
	}
}
