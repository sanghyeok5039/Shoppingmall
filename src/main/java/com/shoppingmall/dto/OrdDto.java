package com.shoppingmall.dto;

import java.util.Date;

public class OrdDto {
	
	private String mbr_id;
	private Date ords_date;
	private String ords_total;
	private String ords_state;
	private String ords_delv_state;
	private String ords_delv_adres;
	private String ords_payment_state;
	private int ords_number;
	private String name;
	private int num;
	private String date;
	private String product_img;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrds_number() {
		return ords_number;
	}
	public void setOrds_number(int ords_number) {
		this.ords_number = ords_number;
	}
	public String getOrds_payment_state() {
		return ords_payment_state;
	}
	public void setOrds_payment_state(String ords_payment_state) {
		this.ords_payment_state = ords_payment_state;
	}
	public String getOrds_state() {
		return ords_state;
	}
	public void setOrds_state(String ords_state) {
		this.ords_state = ords_state;
	}
	public String getMbr_id() {
		return mbr_id;
	}
	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}
	public Date getOrds_date() {
		return ords_date;
	}
	public void setOrds_date(Date ords_date) {
		this.ords_date = ords_date;
	}
	public String getOrds_total() {
		return ords_total;
	}
	public void setOrds_total(String ords_total) {
		this.ords_total = ords_total;
	}
	public String getOrds_delv_state() {
		return ords_delv_state;
	}
	public void setOrds_delv_state(String ords_delv_state) {
		this.ords_delv_state = ords_delv_state;
	}
	public String getOrds_delv_adres() {
		return ords_delv_adres;
	}
	public void setOrds_delv_adres(String ords_delv_adres) {
		this.ords_delv_adres = ords_delv_adres;
	}
	
	
}
