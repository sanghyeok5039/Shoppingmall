package com.shoppingmall.point;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;


public interface IPtService {
	String pointView(HttpSession session);

	String getPoint(Model model, HttpSession session);
}
