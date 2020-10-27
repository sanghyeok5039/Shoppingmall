package com.shoppingmall.dto;

import java.io.Serializable;

public class PtInOutDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	String mbr_id;
	String pt_date;
	String pt_in;
	String pt_out;
	
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public String getPt_date() {
		return pt_date;
	}
	public void setPt_date(String pt_date) {
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
