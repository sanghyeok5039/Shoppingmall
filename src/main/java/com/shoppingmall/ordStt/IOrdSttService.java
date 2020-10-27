package com.shoppingmall.ordStt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface IOrdSttService {
	
	public void ordSttSrch(Model md) ;
	void ordSttCndtnSrch(Model md, HttpServletRequest req);
}
