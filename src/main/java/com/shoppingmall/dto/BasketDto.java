package com.shoppingmall.dto;

public class BasketDto {

	private String num;
	String product_detail_id;
	String mbr_id;
	String product_id;
	String product_name;
	String product_price;
	String product_count;
	int basket_count;
	double product_getPoint;
	int product_total;
	
	
	public String getProduct_detail_id() {
		return product_detail_id;
	}
	public void setProduct_detail_id(String product_detail_id) {
		this.product_detail_id = product_detail_id;
	}
	public BasketDto(){
		this.basket_count = 1;
	}
	public int getBasket_count() {
		return basket_count;
	}
	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}
	public double getProduct_getPoint() {
		return product_getPoint;
	}
	public void setProduct_getPoint() {
		this.product_getPoint = Integer.parseInt(product_price) * 0.05;
	}
	public int getProduct_total() {
		return product_total;
	}
	public void setProduct_total() {
		this.product_total = Integer.parseInt(product_price) * this.basket_count;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_count() {
		return product_count;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	
}
