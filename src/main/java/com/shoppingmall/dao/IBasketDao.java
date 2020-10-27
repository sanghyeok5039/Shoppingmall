package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.BasketDto;

public interface IBasketDao {
	List<BasketDto> search(String mbr_id);
	void insert(BasketDto Bsdto);
	void delete(BasketDto Bsdto);
	void memberdelete(String mbr_id);
}
