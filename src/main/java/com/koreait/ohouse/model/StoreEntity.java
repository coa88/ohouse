package com.koreait.ohouse.model;

import org.apache.ibatis.type.Alias;

@Alias("StoreEntity")
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
	
	public int getiProduct() {
		return iProduct;
	}
	public void setiProduct(int iProduct) {
		this.iProduct = iProduct;
	}
	public int getiUser() {
		return iUser;
	}
	public void setiUser(int iUser) {
		this.iUser = iUser;
	}
	public int getProductTyp() {
		return productTyp;
	}
	public void setProductTyp(int productTyp) {
		this.productTyp = productTyp;
	}
	public int getProductsecTyp() {
		return productsecTyp;
	}
	public void setProductsecTyp(int productsecTyp) {
		this.productsecTyp = productsecTyp;
	}
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductCtnt() {
		return productCtnt;
	}
	public void setProductCtnt(String productCtnt) {
		this.productCtnt = productCtnt;
	}
	public String getProductNm() {
		return productNm;
	}
	public void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getProductDt() {
		return productDt;
	}
	public void setProductDt(String productDt) {
		this.productDt = productDt;
	}	
	
	
}
