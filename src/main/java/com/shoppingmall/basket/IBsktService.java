package com.shoppingmall.basket;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IBsktService {
	String getAllBasket(Model model, String id);
	public String deleteBasket(Model model, String product_id, String mbr_id);
	String getBasketMbr(Model model, HttpSession session);
	String getAllBasketDB(Model model, String id);
	String getAllBasketSession(HttpSession session);
}
