package com.shoppingmall.dto;

public class BasketOrderDto {

	private String product_id;
	private String product_detail_id;
	private String product_size;
	private String product_name;
	private String product_price;
	private String num;
	private int mbr_point;
	private String delivery;
	private String total_price;
	private String img;
	private String product_img;
	
	
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_detail_id() {
		return product_detail_id;
	}
	public void setProduct_detail_id(String product_detail_id) {
		this.product_detail_id = product_detail_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public int getMbr_point() {
		return mbr_point;
	}
	public void setMbr_point(int mbr_point) {
		this.mbr_point = mbr_point;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
