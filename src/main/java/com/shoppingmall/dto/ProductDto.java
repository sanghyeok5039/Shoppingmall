package com.shoppingmall.dto;

public class ProductDto {
	private String product_id;
	private String ctgr_id;
	private String m_crgr_id;
	private String product_name;
	private String product_count;
	private String product_content;
	private String product_state;
	private double product_totalgrade;
	private String product_price;
	private String product_img;
	
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getM_crgr_id() {
		return m_crgr_id;
	}
	public void setM_crgr_id(String m_crgr_id) {
		this.m_crgr_id = m_crgr_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getCtgr_id() {
		return ctgr_id;
	}
	public void setCtgr_id(String ctgr_id) {
		this.ctgr_id = ctgr_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_count() {
		return product_count;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_state() {
		return product_state;
	}
	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	public double getProduct_totalgrade() {
		return product_totalgrade;
	}
	public void setProduct_totalgrade(double product_totalgrade) {
		this.product_totalgrade = product_totalgrade;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
}
