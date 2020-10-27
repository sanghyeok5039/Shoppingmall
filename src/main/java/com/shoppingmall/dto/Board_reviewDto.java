package com.shoppingmall.dto;

import java.util.Date;

public class Board_reviewDto {
	
	private int review_num;
	private String review_title;
	private String review_content;
	private Date review_regdate;
	private String review_readcount;
	private String review_ref;
	private String review_restep;
	private String review_relevel;
	private int review_grade;
	private String product_id;
	private String mbr_id;

	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public String getReview_readcount() {
		return review_readcount;
	}
	public void setReview_readcount(String review_readcount) {
		this.review_readcount = review_readcount;
	}
	public String getReview_ref() {
		return review_ref;
	}
	public void setReview_ref(String review_ref) {
		this.review_ref = review_ref;
	}
	public String getReview_restep() {
		return review_restep;
	}
	public void setReview_restep(String review_restep) {
		this.review_restep = review_restep;
	}
	public String getReview_relevel() {
		return review_relevel;
	}
	public void setReview_relevel(String review_relevel) {
		this.review_relevel = review_relevel;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	
	
}
