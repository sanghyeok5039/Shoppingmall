package com.shoppingmall.dao;

import com.shoppingmall.dto.OrdSttDTO;

public interface OrdDtDAO {
	
	void getOne(String id, String date);
	void insert(OrdSttDTO dto);
	void update(OrdSttDTO dto);
	void delete(String id, String date);
}
