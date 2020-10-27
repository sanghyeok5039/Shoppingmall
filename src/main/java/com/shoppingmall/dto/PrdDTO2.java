package com.shoppingmall.dto;

public class PrdDTO2 {
	private String prdId;
	private String ctgrId;
	private String prdName;
	private String prdCnt;
	private String prdContent;
	private String prdStt;
	private String prdGrade;
	private String prdPrice;
	
	public String getPrdId() {
		return prdId;
	}
	public void setPrdId(String prdId) {
		this.prdId = prdId;
	}
	public String getCtgrId() {
		return ctgrId;
	}
	public void setCtgrId(String ctgrId) {
		this.ctgrId = ctgrId;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getPrdCnt() {
		return prdCnt;
	}
	public void setPrdCnt(String prdCnt) {
		this.prdCnt = prdCnt;
	}
	public String getPrdContent() {
		return prdContent;
	}
	public void setPrdContent(String prdContent) {
		this.prdContent = prdContent;
	}
	public String getPrdStt() {
		return prdStt;
	}
	public void setPrdStt(String prdStt) {
		this.prdStt = prdStt;
	}
	public String getPrdGrade() {
		return prdGrade;
	}
	public void setPrdGrade(String prdGrade) {
		this.prdGrade = prdGrade;
	}
	public String getPrdPrice() {
		return prdPrice;
	}
	public void setPrdPrice(String prdPrice) {
		this.prdPrice = prdPrice;
	}
//	private String prdId;
//	private String ctgrId;
//	private String prdName;
//	private String prdCnt;
//	private String prdContent;
//	private String prdStt;
//	private String prdGrade;
//	private String prdPrice;
	
	public String toString() {
		
		return  "prdId="+prdId+","+
				"ctgrId="+ctgrId+","+
				"prdName="+prdName+","+
				"prdCnt="+prdCnt+","+
				"prdContent="+prdContent+","+
				"prdStt="+prdStt+","+
				"prdGrade="+prdGrade+","+
				"prdPrice="+prdPrice+",";
				
		
	}
	
	
}
