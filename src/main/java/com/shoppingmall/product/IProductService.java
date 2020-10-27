package com.shoppingmall.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IProductService {

	String showmain(Model model, HttpSession session,String m_ctgr_id);

	String showctgr(Model model, HttpSession session,String ctgr_id);
	
	String showname(Model model, HttpSession session,String product_name);
	
	String show(String product_id,Model model);
	
	String search(Model model,HttpServletRequest request);
	
	void mainpage(Model model, HttpSession session);

}