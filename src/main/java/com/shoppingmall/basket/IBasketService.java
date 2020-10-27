package com.shoppingmall.basket;

import org.springframework.ui.Model;

import com.shoppingmall.dto.BasketDto;

public interface IBasketService {

	String search(String mbr_id, Model model);

	String insert(BasketDto dto, Model model);
	
	String delete(BasketDto dto, Model model);
	
	String open(String mbr_id,Model model);
}