package com.shoppingmall.dto;

import java.util.Date;

public class Product_InOutDto {
	
	private String product_detail_id;
	private Date prd_inout_date;
	private String prd_in;
	private String prd_out;
	
	public String getproduct_detail_id() {
		return product_detail_id;
	}
	public void setproduct_detail_id(String product_detail_id) {
		this.product_detail_id = product_detail_id;
	}
	public Date getPrd_inout_date() {
		return prd_inout_date;
	}
	public void setPrd_inout_date(Date prd_inout_date) {
		this.prd_inout_date = prd_inout_date;
	}
	public String getPrd_in() {
		return prd_in;
	}
	public void setPrd_in(String prd_in) {
		this.prd_in = prd_in;
	}
	public String getPrd_out() {
		return prd_out;
	}
	public void setPrd_out(String prd_out) {
		this.prd_out = prd_out;
	}
}
