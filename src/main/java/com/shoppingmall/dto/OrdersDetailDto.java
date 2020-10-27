package com.shoppingmall.dto;

import java.util.Date;

public class OrdersDetailDto {
	private String ords_detail_count;
	private Date ords_date;
	private String Product_id;
	private String product_detail_id;
	private String mbr_id;
	private String name;
	private String price;
	private String date;
	private String size;
	private String product_img;
	
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getProduct_detail_id() {
		return product_detail_id;
	}
	public void setProduct_detail_id(String product_detail_id) {
		this.product_detail_id = product_detail_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrds_detail_count() {
		return ords_detail_count;
	}
	public void setOrds_detail_count(String ords_detail_count) {
		this.ords_detail_count = ords_detail_count;
	}
	public Date getOrds_date() {
		return ords_date;
	}
	public void setOrds_date(Date ords_date) {
		this.ords_date = ords_date;
	}
	public String getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(String product_id) {
		Product_id = product_id;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	
	
}
