package com.shoppingmall.dto;

import java.util.Date;

public class NoticeDto {
	int notice_num;
	String mbr_id;
	String notice_title;
	String notice_content;
	Date   notice_regDate;
	String notice_readCount;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regDate() {
		return notice_regDate;
	}
	public void setNotice_regDate(Date notice_regDate) {
		this.notice_regDate = notice_regDate;
	}
	public String getNotice_readCount() {
		return notice_readCount;
	}
	public void setNotice_readCount(String notice_readCount) {
		this.notice_readCount = notice_readCount;
	}
	
	
}
