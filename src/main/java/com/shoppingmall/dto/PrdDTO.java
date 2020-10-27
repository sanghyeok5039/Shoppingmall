package com.shoppingmall.dto;

public class PrdDTO {
	
	private String prd_id;
	private String prd_name;
	private String ctgr_id;
	private String m_ctgr_id;
	private String prd_img;
	private String prd_cntnt;
	private String prd_color;
	private String prd_size;
	private String prd_cnt;
	private String prd_price;
	private String prd_stt;
	private String df_id;
	private String prd_grade;
	


	public String getPrd_grade() {
		return prd_grade;
	}



	public void setPrd_grade(String prd_grade) {
		this.prd_grade = prd_grade;
	}



	public String getDf_id() {
		return df_id;
	}



	public void setDf_id(String df_id) {
		this.df_id = df_id;
	}



	public String getPrd_id() {
		return prd_id;
	}



	public void setPrd_id(String prd_id) {
		this.prd_id = prd_id;
	}



	public String getPrd_name() {
		return prd_name;
	}



	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}



	public String getCtgr_id() {
		return ctgr_id;
	}



	public void setCtgr_id(String ctgr_id) {
		this.ctgr_id = ctgr_id;
	}



	public String getM_ctgr_id() {
		return m_ctgr_id;
	}



	public void setM_ctgr_id(String m_ctgr_id) {
		this.m_ctgr_id = m_ctgr_id;
	}



	public String getPrd_img() {
		return prd_img;
	}



	public void setPrd_img(String prd_img) {
		this.prd_img = prd_img;
	}



	public String getPrd_cntnt() {
		return prd_cntnt;
	}



	public void setPrd_cntnt(String prd_cntnt) {
		this.prd_cntnt = prd_cntnt;
	}



	public String getPrd_color() {
		return prd_color;
	}



	public void setPrd_color(String prd_color) {
		this.prd_color = prd_color;
	}



	public String getPrd_size() {
		return prd_size;
	}



	public void setPrd_size(String prd_size) {
		this.prd_size = prd_size;
	}



	public String getPrd_cnt() {
		return prd_cnt;
	}



	public void setPrd_cnt(String prd_cnt) {
		this.prd_cnt = prd_cnt;
	}



	public String getPrd_price() {
		return prd_price;
	}



	public void setPrd_price(String prd_price) {
		this.prd_price = prd_price;
	}



	public String getPrd_stt() {
		return prd_stt;
	}



	public void setPrd_stt(String prd_stt) {
		this.prd_stt = prd_stt;
	}



	public String toString() {
		
		return  "productId="+prd_id+","+
				"ctgrId="+ctgr_id+","+
				"productName="+prd_name+","+
				"productCnt="+prd_cnt+","+
				"productContent="+prd_img+","+
				"productStt="+prd_stt+","+
				"productGrade="+m_ctgr_id+","+
				"productPrice="+prd_price+",";
		
	}

	
}
