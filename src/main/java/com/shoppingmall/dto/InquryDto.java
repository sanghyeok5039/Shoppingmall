package com.shoppingmall.dto;

import java.util.Date;

public class InquryDto {
	int    qanda_num;
	String mbr_id;
	String qanda_title;
	String qanda_content;
	String qanda_answer;
	Date   qanda_regDate;
	String qanda_readCount;
	String qanda_at;
	
	public int getQanda_num() {
		return qanda_num;
	}
	public void setQanda_num(int qanda_num) {
		this.qanda_num = qanda_num;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public String getQanda_title() {
		return qanda_title;
	}
	public void setQanda_title(String qanda_title) {
		this.qanda_title = qanda_title;
	}
	public String getQanda_content() {
		return qanda_content;
	}
	public void setQanda_content(String qanda_content) {
		this.qanda_content = qanda_content;
	}
	public String getQanda_answer() {
		return qanda_answer;
	}
	public void setQanda_answer(String qanda_answer) {
		this.qanda_answer = qanda_answer;
	}
	public Date getQanda_regDate() {
		return qanda_regDate;
	}
	public void setQanda_regDate(Date qanda_regDate) {
		this.qanda_regDate = qanda_regDate;
	}
	public String getQanda_readCount() {
		return qanda_readCount;
	}
	public void setQanda_readCount(String qanda_readCount) {
		this.qanda_readCount = qanda_readCount;
	}
	public String getQanda_at() {
		return qanda_at;
	}
	public void setQanda_at(String qanda_at) {
		this.qanda_at = qanda_at;
	}
	

}
