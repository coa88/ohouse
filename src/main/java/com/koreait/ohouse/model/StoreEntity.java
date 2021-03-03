package com.koreait.ohouse.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreEntity {
	private int iProduct;
	private int iUser;
	private int productTyp;
	private int productsecTyp;
	private int productSeq;
	private String productTitle;
	private String productCtnt;
	private String productNm;
	private int price;
	private int sales;
	private int finalPrice;
	private String productDt;	
}
