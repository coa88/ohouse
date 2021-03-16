package com.koreait.ohouse.model;

import org.springframework.web.multipart.MultipartFile;

public class CommunityDTO extends CommunityEntity {
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
