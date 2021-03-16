package com.koreait.ohouse.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ImgUploadUtils {

	@Autowired
	private ServletContext ctx;
	//베이스 경로 리턴
	public String getBasePath(String more) {
		return ctx.getRealPath(more);
	}
	//경로에 폴더 만들기
	public void makeDirectories(String path) {
		File file = new File(path);
		if(!file.exists()) { //exists는 존재하면 true
			file.mkdirs();
		}
	}
	//확장자 리턴
	public String getExt(String fileNm) {
//		return FilenameUtils.getExtension(fileNm);
		return fileNm.substring(fileNm.lastIndexOf(".") + 1);
	}
	//파일이름 랜덤으로 만들어주기
	public String getRandomFileNm() {
		return UUID.randomUUID().toString();
	}
	//파일이름 랜덤으로 만든거에 확장자 붙이기
	public String getRandomFileNm(String originalFileNm) {
		return getRandomFileNm() + "." + getExt(originalFileNm);
	}
	//위의 메소드 합침.
	public String saveFile(MultipartFile mf, String folder) {
		String basePath = getBasePath(folder);
		makeDirectories(basePath);
		String fileNm = getRandomFileNm(mf.getOriginalFilename());
		
		try {
			System.out.println("mf empty : " + mf.isEmpty());
			File file = new File(basePath, fileNm);
			mf.transferTo(file);
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return fileNm;
	}
	
	public boolean delFile(String path) {
		String basePath = getBasePath("/resources");
		File file = new File(basePath, path);
		if(file.exists()) {
			file.delete();
		}
		return false;
	}
	
}
