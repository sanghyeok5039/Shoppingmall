package com.shoppingmall.prd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IPrdService {

	String prdMulSrch(Model md);
	String prdOneSrch(Model md, HttpServletRequest req);
	void prdInsert(Model md, HttpServletRequest req);
	String prdUpdate(Model md, HttpServletRequest req);
	String prdDelete(String id);
	String setCategory(Model md);
	String setCategoryMenu(HttpSession session);			// <-- 이 부분 사용하지 않는건가요 ?
	
	String prdCndtnSrch(Model md, HttpServletRequest req);
	
	String getCnt(String size, String id);	
	
}
