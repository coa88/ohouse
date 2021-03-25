package com.koreait.ohouse.model;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO extends StoreEntity {
	private MultipartFile[] file;

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	
}
