package com.shoppingmall.order;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IOrderService {

	String insert(HttpServletRequest request,Model model);

	String search(String mbr_id, Model model);

	String directopen(String product_id, String num, String mbr_id,String product_detail_id, Model model);

	void List(Model model,HttpServletRequest request,HttpSession session);
	
	void detailList(Model model,HttpServletRequest request,HttpSession session) throws ParseException;

}