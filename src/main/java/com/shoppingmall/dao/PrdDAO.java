package com.shoppingmall.dao;

import com.shoppingmall.dto.PrdDTO;
import com.shoppingmall.dto.PrdEleDTO;

public interface PrdDAO {
	
	PrdDTO getOne(String id);
	void insert(PrdDTO dto);
	void update(PrdDTO dto);
	void delete(String id);
	PrdEleDTO getEleOne(String id);
	
	
}
