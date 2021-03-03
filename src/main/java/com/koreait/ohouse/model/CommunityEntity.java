package com.koreait.ohouse.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommunityEntity {
	private int iBoard;
	private int iUser;
	private int typ;
	private int secTyp;
	private int seq;
	private String title;
	private String ctnt;
	private String rDt;
	private int hits;
	private String boardImg;
}
