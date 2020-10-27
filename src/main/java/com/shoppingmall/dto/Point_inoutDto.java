package com.shoppingmall.dto;

import java.util.Date;

public class Point_inoutDto {
	
	private String mbr_id;
	private Date pt_date;
	private String pt_in;
	private String pt_out;
	
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public Date getPt_date() {
		return pt_date;
	}
	public void setPt_date(Date pt_date) {
		this.pt_date = pt_date;
	}
	public String getPt_in() {
		return pt_in;
	}
	public void setPt_in(String pt_in) {
		this.pt_in = pt_in;
	}
	public String getPt_out() {
		return pt_out;
	}
	public void setPt_out(String pt_out) {
		this.pt_out = pt_out;
	}

}
