package com.shoppingmall.closing;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IClosingService {
	String saleList(Model model);
	String saleLog(Model model, String year, String month);
	String closing(Model model,HttpSession session);
	void  chkClosing(Model model,HttpSession session);
	
}
