package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("CommunityDTO")
public class CommunityDTO extends CommunityEntity {
	private String communityImg;

	public String getCommunityImg() {
		return communityImg;
	}

	public void setCommunityImg(String communityImg) {
		this.communityImg = communityImg;
	}

}
