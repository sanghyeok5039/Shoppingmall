package com.shoppingmall.dto;

public class CountDto {
	
	private int startNum;
	private int pageNum;
	private String m_ctgr_id;
	private String ctgr_id;
	private String product_name;
	private String product_id;
	private String num; 
	private String mbr_id;
	
	
	public String getM_ctgr_id() {
		return m_ctgr_id;
	}
	public void setM_ctgr_id(String m_ctgr_id) {
		this.m_ctgr_id = m_ctgr_id;
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
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}
