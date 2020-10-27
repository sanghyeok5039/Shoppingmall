package com.shoppingmall.dto;

public class OrderListDto {
	
	private ProductDetailDto pddto;
	private ProductDto pdto;
	private String num;
	private String total;
	private String img;
	
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public ProductDetailDto getPddto() {
		return pddto;
	}
	public void setPddto(ProductDetailDto pddto) {
		this.pddto = pddto;
	}
	public ProductDto getPdto() {
		return pdto;
	}
	public void setPdto(ProductDto pdto) {
		this.pdto = pdto;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}
